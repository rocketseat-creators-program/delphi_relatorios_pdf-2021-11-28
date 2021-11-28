object FMenuRelatorios: TFMenuRelatorios
  Left = 0
  Top = 0
  Caption = 'FMenuRelatorios'
  ClientHeight = 454
  ClientWidth = 1137
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1137
    Height = 129
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 888
    object Label1: TLabel
      Left = 48
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Pesquisa:'
    end
    object Label2: TLabel
      Left = 56
      Top = 48
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object Label3: TLabel
      Left = 56
      Top = 75
      Width = 30
      Height = 13
      Caption = 'Setor:'
    end
    object edtGrupo: TEdit
      Left = 112
      Top = 45
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object edtSetor: TEdit
      Left = 112
      Top = 72
      Width = 209
      Height = 21
      TabOrder = 1
    end
    object btnPesquisar: TButton
      Left = 344
      Top = 41
      Width = 145
      Height = 50
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object btnLimparPesquisa: TButton
      Left = 520
      Top = 41
      Width = 145
      Height = 50
      Caption = 'Limpar pesquisa'
      TabOrder = 3
      OnClick = btnLimparPesquisaClick
    end
    object btnImprmirRelatorio: TButton
      Left = 688
      Top = 41
      Width = 145
      Height = 50
      Caption = 'Imprimir'
      TabOrder = 4
      OnClick = btnImprmirRelatorioClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 1137
    Height = 325
    Align = alClient
    TabOrder = 1
    ExplicitTop = 8
    ExplicitWidth = 888
    ExplicitHeight = 97
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1135
      Height = 323
      Align = alClient
      DataSource = dssPesquisa
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object qryPesquisa: TFDQuery
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'select p.idproduto, p.nomeproduto, p.pvenda,'
      '       p.idgrupo, g.descricaogrupo,'
      '       p.idsetor, s.descricaosetor'
      'from tb_produto p'
      'join tb_grupo   g on (p.idgrupo = g.idgrupo)'
      'join tb_setor   s on (p.idsetor = s.idsetor)'
      ''
      'order by s.idsetor, g.idgrupo, p.idproduto')
    Left = 136
    Top = 248
    object qryPesquisaIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Origin = 'IDPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Origin = 'NOMEPRODUTO'
      Size = 60
    end
    object qryPesquisaPVENDA: TFloatField
      FieldName = 'PVENDA'
      Origin = 'PVENDA'
    end
    object qryPesquisaIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Origin = 'IDGRUPO'
      Required = True
    end
    object qryPesquisaDESCRICAOGRUPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAOGRUPO'
      Origin = 'DESCRICAOGRUPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPesquisaIDSETOR: TIntegerField
      FieldName = 'IDSETOR'
      Origin = 'IDSETOR'
      Required = True
    end
    object qryPesquisaDESCRICAOSETOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAOSETOR'
      Origin = 'DESCRICAOSETOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
  end
  object dssPesquisa: TDataSource
    DataSet = cdsPesquisa
    Left = 384
    Top = 368
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisa'
    Left = 296
    Top = 328
    object cdsPesquisaIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Origin = 'IDPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesquisaNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Origin = 'NOMEPRODUTO'
      Size = 60
    end
    object cdsPesquisaPVENDA: TFloatField
      FieldName = 'PVENDA'
      Origin = 'PVENDA'
    end
    object cdsPesquisaIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      Origin = 'IDGRUPO'
      Required = True
    end
    object cdsPesquisaDESCRICAOGRUPO: TStringField
      FieldName = 'DESCRICAOGRUPO'
      Origin = 'DESCRICAOGRUPO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cdsPesquisaIDSETOR: TIntegerField
      FieldName = 'IDSETOR'
      Origin = 'IDSETOR'
      Required = True
    end
    object cdsPesquisaDESCRICAOSETOR: TStringField
      FieldName = 'DESCRICAOSETOR'
      Origin = 'DESCRICAOSETOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
  end
  object dspPesquisa: TDataSetProvider
    DataSet = qryPesquisa
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 224
    Top = 280
  end
  object qryImprimir: TFDQuery
    Active = True
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'select p.idproduto, p.nomeproduto, p.pvenda,'
      '       p.idgrupo, g.descricaogrupo,'
      '       p.idsetor, s.descricaosetor'
      'from tb_produto p'
      'join tb_grupo   g on (p.idgrupo = g.idgrupo)'
      'join tb_setor   s on (p.idsetor = s.idsetor)'
      ''
      'order by s.idsetor, g.idgrupo, p.idproduto')
    Left = 560
    Top = 232
  end
  object dssImprmir: TDataSource
    DataSet = qryImprimir
    Left = 616
    Top = 272
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = pppImprimir
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 768
    Top = 361
    Version = '19.03'
    mmColumnWidth = 0
    DataPipelineName = 'pppImprimir'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Border.mmPadding = 0
        Caption = 'Listagem de Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 18
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 7673
        mmLeft = 56886
        mmTop = 2117
        mmWidth = 73554
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        OnPrint = ppLabel2Print
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Border.mmPadding = 0
        Caption = 'Filtro da pesquisa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 3439
        mmLeft = 3175
        mmTop = 11642
        mmWidth = 26458
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'IDPRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 8996
        mmTop = -794
        mmWidth = 34131
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        Border.mmPadding = 0
        DataField = 'IDPRODUTO'
        DataPipeline = pppImprimir
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pppImprimir'
        mmHeight = 4763
        mmLeft = 44186
        mmTop = -794
        mmWidth = 10848
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'NOMEPRODUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 70644
        mmTop = -265
        mmWidth = 34131
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        Border.mmPadding = 0
        DataField = 'NOMEPRODUTO'
        DataPipeline = pppImprimir
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pppImprimir'
        mmHeight = 4763
        mmLeft = 105834
        mmTop = -265
        mmWidth = 49213
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'PVENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 156898
        mmTop = -265
        mmWidth = 20902
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        Border.mmPadding = 0
        DataField = 'PVENDA'
        DataPipeline = pppImprimir
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pppImprimir'
        mmHeight = 4763
        mmLeft = 180182
        mmTop = -265
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        Border.mmPadding = 0
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 163513
        mmTop = 1323
        mmWidth = 32279
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDSETOR'
      DataPipeline = pppImprimir
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pppImprimir'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label3'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'C'#243'd. Setor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 4763
          mmLeft = 794
          mmTop = 529
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText1: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText1'
          Border.mmPadding = 0
          DataField = 'IDSETOR'
          DataPipeline = pppImprimir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pppImprimir'
          mmHeight = 4763
          mmLeft = 21167
          mmTop = 529
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel4: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label4'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Descri'#231#227'o Setor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 4763
          mmLeft = 32806
          mmTop = 529
          mmWidth = 40481
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText2: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText2'
          Border.mmPadding = 0
          DataField = 'DESCRICAOSETOR'
          DataPipeline = pppImprimir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pppImprimir'
          mmHeight = 4763
          mmLeft = 77521
          mmTop = 529
          mmWidth = 80433
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          DesignLayer = ppDesignLayer1
          UserName = 'DBCalc1'
          Border.mmPadding = 0
          DataField = 'PVENDA'
          DataPipeline = pppImprimir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Verdana'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          Transparent = True
          DataPipelineName = 'pppImprimir'
          mmHeight = 4498
          mmLeft = 177271
          mmTop = -265
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc2: TppDBCalc
          DesignLayer = ppDesignLayer1
          UserName = 'DBCalc2'
          Border.mmPadding = 0
          DataField = 'IDPRODUTO'
          DataPipeline = pppImprimir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Verdana'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pppImprimir'
          mmHeight = 4498
          mmLeft = 146315
          mmTop = -265
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDGRUPO'
      DataPipeline = pppImprimir
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pppImprimir'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel5: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label5'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'C'#243'd. Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 4763
          mmLeft = 6085
          mmTop = -265
          mmWidth = 28310
          BandType = 3
          GroupNo = 1
          LayerName = Foreground
        end
        object ppDBText3: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText3'
          Border.mmPadding = 0
          DataField = 'IDGRUPO'
          DataPipeline = pppImprimir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pppImprimir'
          mmHeight = 4763
          mmLeft = 37835
          mmTop = -265
          mmWidth = 8467
          BandType = 3
          GroupNo = 1
          LayerName = Foreground
        end
        object ppLabel6: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label6'
          AutoSize = False
          Border.mmPadding = 0
          Caption = 'Descri'#231#227'o Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          Transparent = True
          mmHeight = 4763
          mmLeft = 50798
          mmTop = -265
          mmWidth = 41275
          BandType = 3
          GroupNo = 1
          LayerName = Foreground
        end
        object ppDBText4: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText4'
          Border.mmPadding = 0
          DataField = 'DESCRICAOGRUPO'
          DataPipeline = pppImprimir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pppImprimir'
          mmHeight = 4763
          mmLeft = 93131
          mmTop = -265
          mmWidth = 159809
          BandType = 3
          GroupNo = 1
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppDBCalc4: TppDBCalc
          DesignLayer = ppDesignLayer1
          UserName = 'DBCalc4'
          Border.mmPadding = 0
          DataField = 'PVENDA'
          DataPipeline = pppImprimir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Verdana'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          Transparent = True
          DataPipelineName = 'pppImprimir'
          mmHeight = 4498
          mmLeft = 176213
          mmTop = -265
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object ppDBCalc3: TppDBCalc
          DesignLayer = ppDesignLayer1
          UserName = 'DBCalc3'
          Border.mmPadding = 0
          DataField = 'IDPRODUTO'
          DataPipeline = pppImprimir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Verdana'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pppImprimir'
          mmHeight = 4498
          mmLeft = 147373
          mmTop = -265
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object pppImprimir: TppDBPipeline
    DataSource = dssImprmir
    UserName = 'pImprimir'
    Left = 688
    Top = 321
    object pppImprimirppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPRODUTO'
      FieldName = 'IDPRODUTO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object pppImprimirppField2: TppField
      FieldAlias = 'NOMEPRODUTO'
      FieldName = 'NOMEPRODUTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pppImprimirppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PVENDA'
      FieldName = 'PVENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pppImprimirppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object pppImprimirppField5: TppField
      FieldAlias = 'DESCRICAOGRUPO'
      FieldName = 'DESCRICAOGRUPO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object pppImprimirppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSETOR'
      FieldName = 'IDSETOR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object pppImprimirppField7: TppField
      FieldAlias = 'DESCRICAOSETOR'
      FieldName = 'DESCRICAOSETOR'
      FieldLength = 25
      DisplayWidth = 25
      Position = 6
    end
  end
end
