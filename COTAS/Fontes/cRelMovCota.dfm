inherited cfgRelMovCota: TcfgRelMovCota
  Left = 318
  Top = 137
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Movimentação de Cotas'
  ClientHeight = 334
  ClientWidth = 376
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 376
    Height = 295
    object Label4: TLabel
      Left = 16
      Top = 98
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object Label1: TLabel
      Left = 16
      Top = 55
      Width = 31
      Height = 13
      Caption = 'Patro'
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 201
      Width = 344
      Height = 85
      TabOrder = 4
      object chkCorLinha: TCheckBox
        Left = 8
        Top = 37
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cboCorLinha: TfcColorCombo
        Left = 250
        Top = 34
        Width = 87
        Height = 21
        AlignmentVertical = fcavCenter
        AutoSelect = False
        Color = clWhite
        ColorDialogOptions = []
        ColorListOptions.Color = clWhite
        ColorListOptions.ColorWidth = 119
        ColorListOptions.Font.Charset = DEFAULT_CHARSET
        ColorListOptions.Font.Color = clWindowText
        ColorListOptions.Font.Height = -11
        ColorListOptions.Font.Name = 'MS Sans Serif'
        ColorListOptions.Font.Style = []
        ColorListOptions.GreyScaleIncrement = 1
        ColorListOptions.Options = [ccoShowCustomColors]
        CustomColors.Strings = (
          'ColorA=FFFFFF'
          'ColorC=00C0FFFF'
          'ColorD=00C6F9CC'
          'ColorE=00F3E6CD'
          'ColorF=00A0A0A0'
          'ColorG=00BEBEBE'
          'ColorH=00D2D2D2'
          'ColorI=00E3E3E3'
          'ColorJ=00f00000')
        DropDownCount = 8
        DropDownWidth = 8
        ReadOnly = False
        ShowMatchText = False
        SelectedColor = clWhite
        TabOrder = 2
      end
      object chkLinhas: TCheckBox
        Left = 8
        Top = 13
        Width = 321
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 0
      end
      object chkExpandido: TCheckBox
        Left = 8
        Top = 59
        Width = 325
        Height = 17
        Caption = 'Expandido'
        TabOrder = 3
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 144
      Width = 344
      Height = 52
      Caption = ' Período de Datas '
      TabOrder = 3
      object Label5: TLabel
        Left = 17
        Top = 24
        Width = 27
        Height = 13
        Caption = 'de:  '
      end
      object Label6: TLabel
        Left = 171
        Top = 24
        Width = 27
        Height = 13
        Caption = 'até: '
      end
      object edtDataIni: TwwDBDateTimePicker
        Left = 42
        Top = 20
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
      object edtDataFim: TwwDBDateTimePicker
        Left = 201
        Top = 20
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
    end
    object DBcboPlano: TCMDBLookupCombo
      Left = 16
      Top = 112
      Width = 344
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPLANO'#9'40'#9'Descrição'#9'F')
      LookupTable = CdsPlano
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = DBcboPlanoEnter
    end
    object DBcboPatro: TCMDBLookupCombo
      Left = 16
      Top = 69
      Width = 344
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPATRO'#9'40'#9'Descrição'#9'F')
      LookupTable = CdsPatro
      LookupField = 'IDPATRO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = DBcboPatroEnter
    end
    inline molAtivoCota1: TmolAtivoCota
      Left = 8
      Width = 361
      Height = 49
      TabStop = True
      inherited edtDescAtivo: TEdit
        Width = 318
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 326
        OnClick = molAtivoCota1btnBuscaContratoClick
      end
      inherited btnLimpaAtivo: TBitBtn
        Left = 294
        Top = 8
      end
    end
  end
  inherited Dock971: TDock97
    Top = 295
    Width = 376
    inherited tb97Fundo: TToolbar97
      Left = 204
      DockPos = 473
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 35
      DockPos = 304
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      
        'DECODE(A.DESCRICAO,NULL,DECODE(A.IDFUNDOINVEST,NULL,DECODE(A.IDI' +
        'NVESTIMENTO,NULL,DECODE(A.IDTIPOCONTREMPTMO,NULL,DECODE(A.IDIMOV' +
        'EL,NULL,DECODE(A.IDCARTEIRASPC,NULL,'#39#39',(SELECT DESCARTEIRASPC FR' +
        'OM CARTEIRASPC WHERE IDCARTEIRASPC = A.IDCARTEIRASPC)),'#39'Imobiliá' +
        'rio'#39'),'#39'Empréstimo'#39'),(SELECT TI.DESCTIPOINVEST FROM INVESTIMENTO ' +
        'I, TIPOINVEST TI WHERE TI.IDTIPOINVEST = I.IDTIPOINVEST AND I.ID' +
        'INVESTIMENTO = A.IDINVESTIMENTO)),(SELECT(TI.DESCTIPOINVEST||'#39' -' +
        ' '#39'||TF.DESCTIPOFUNDOINV)AS DESCRICAO FROM FUNDOINVEST F, TIPOINV' +
        'EST TI, TIPOFUNDOINVEST TF WHERE F.IDTIPOFUNDOINVEST = TF.IDTIPO' +
        'FUNDOINVEST AND TF.IDTIPOINVEST = TI.IDTIPOINVEST AND F.IDFUNDOI' +
        'NVEST = A.IDFUNDOINVEST)),'#39'Cotas Manuais'#39')'
      
        'DECODE(A.DESCRICAO,NULL,DECODE(A.IDFUNDOINVEST,NULL,DECODE(A.IDI' +
        'NVESTIMENTO,NULL,DECODE(A.IDTIPOCONTREMPTMO,NULL,DECODE(A.IDIMOV' +
        'EL,NULL,DECODE(A.IDCARTEIRASPC,NULL,'#39#39',(SELECT DESCARTEIRASPC FR' +
        'OM CARTEIRASPC WHERE IDCARTEIRASPC = A.IDCARTEIRASPC)),(SELECT I' +
        'MONOME FROM IMOVEL WHERE IDIMOVEL = A.IDIMOVEL)),(SELECT TCEDESC' +
        'RICAO FROM TIPOCONTREMPTMO WHERE IDTIPOCONTREMPTMO = A.IDTIPOCON' +
        'TREMPTMO)),(SELECT DESCINVESTIMENTO FROM INVESTIMENTO WHERE IDIN' +
        'VESTIMENTO = A.IDINVESTIMENTO)), (SELECT DESCFUNDOINVEST FROM FU' +
        'NDOINVEST WHERE IDFUNDOINVEST = A.IDFUNDOINVEST)),A.DESCRICAO)')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Origem'
      'Ativo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'ATIVOCOTA A')
    CamposChave.Strings = (
      'A.IDATIVOCOTA'
      
        'DECODE(A.DESCRICAO,NULL,DECODE(A.IDFUNDOINVEST,NULL,DECODE(A.IDI' +
        'NVESTIMENTO,NULL,DECODE(A.IDTIPOCONTREMPTMO,NULL,DECODE(A.IDIMOV' +
        'EL,NULL,DECODE(A.IDCARTEIRASPC,NULL,'#39#39',(SELECT DESCARTEIRASPC FR' +
        'OM CARTEIRASPC WHERE IDCARTEIRASPC = A.IDCARTEIRASPC)),(SELECT I' +
        'MONOME FROM IMOVEL WHERE IDIMOVEL = A.IDIMOVEL)),(SELECT TCEDESC' +
        'RICAO FROM TIPOCONTREMPTMO WHERE IDTIPOCONTREMPTMO = A.IDTIPOCON' +
        'TREMPTMO)),(SELECT DESCINVESTIMENTO FROM INVESTIMENTO WHERE IDIN' +
        'VESTIMENTO = A.IDINVESTIMENTO)), (SELECT DESCFUNDOINVEST FROM FU' +
        'NDOINVEST WHERE IDFUNDOINVEST = A.IDFUNDOINVEST)),A.DESCRICAO)'
      
        'DECODE(A.DESCRICAO,NULL,DECODE(A.IDFUNDOINVEST,NULL,DECODE(A.IDI' +
        'NVESTIMENTO,NULL,DECODE(A.IDTIPOCONTREMPTMO,NULL,DECODE(A.IDIMOV' +
        'EL,NULL,DECODE(A.IDCARTEIRASPC,NULL,'#39#39','#39'13'#39'),'#39'3'#39'),'#39'2'#39'),DECODE((S' +
        'ELECT TI.IDTIPOINVEST FROM INVESTIMENTO IV, TIPOINVEST TI WHERE ' +
        'TI.IDTIPOINVEST = IV.IDTIPOINVEST AND IV.IDINVESTIMENTO = A.IDIN' +
        'VESTIMENTO),'#39'1'#39','#39'4'#39','#39'2'#39','#39'5'#39','#39'3'#39','#39'6'#39','#39'4'#39','#39'7'#39','#39'8'#39','#39'8'#39')),DECODE((SE' +
        'LECT TI.IDTIPOINVEST FROM FUNDOINVEST F, TIPOINVEST TI, TIPOFUND' +
        'OINVEST TF WHERE F.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST AND ' +
        'TF.IDTIPOINVEST = TI.IDTIPOINVEST AND F.IDFUNDOINVEST = A.IDFUND' +
        'OINVEST),'#39'5'#39','#39'9'#39','#39'6'#39','#39'10'#39','#39'7'#39','#39'11'#39','#39'9'#39','#39'12'#39')),'#39'1'#39')')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '35'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 256
    Top = 16
  end
  object CdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 315
    Top = 104
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 315
    Top = 61
  end
end
