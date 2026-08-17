inherited frmAcertaHistmovreserva: TfrmAcertaHistmovreserva
  Left = 178
  Top = 100
  HelpContext = 160058
  AutoSize = True
  Caption = 'Acerto do Histórico de Alimentação de Reservas'
  ClientHeight = 476
  ClientWidth = 734
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 734
    Height = 437
    object Splitter1: TSplitter
      Left = 1
      Top = 202
      Width = 732
      Height = 5
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object plnTop: TPanel
      Left = 1
      Top = 1
      Width = 732
      Height = 201
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object pnlDadosParticipante: TPanel
        Left = 0
        Top = 40
        Width = 732
        Height = 96
        Align = alClient
        TabOrder = 2
        object lblParticip: TLabel
          Left = 16
          Top = 10
          Width = 69
          Height = 13
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPatro: TLabel
          Left = 296
          Top = 50
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 16
          Top = 50
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblMatricula: TLabel
          Left = 440
          Top = 10
          Width = 55
          Height = 13
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edNome: TEdit
          Left = 16
          Top = 24
          Width = 409
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edPatro: TEdit
          Left = 296
          Top = 64
          Width = 265
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edMatricula: TEdit
          Left = 440
          Top = 24
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edPlano: TEdit
          Left = 16
          Top = 64
          Width = 265
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object pnlPatroPlano: TPanel
        Left = 0
        Top = 40
        Width = 732
        Height = 96
        Align = alClient
        TabOrder = 3
        object Label4: TLabel
          Left = 16
          Top = 50
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 16
          Top = 10
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBcboPatro: TwwDBLookupCombo
          Left = 16
          Top = 24
          Width = 425
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME'#9'F')
          LookupTable = qryPatro
          LookupField = 'IDPESSOA'
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboPatroCloseUp
          OnExit = DBcboPatroExit
        end
        object DBcboPlano: TwwDBLookupCombo
          Left = 16
          Top = 64
          Width = 425
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Plano Previdenciário'#9'F')
          LookupTable = qryPlano
          LookupField = 'IDPLANOPREV'
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
      end
      object pnlOpcao2: TPanel
        Left = 0
        Top = 136
        Width = 732
        Height = 65
        Align = alBottom
        TabOrder = 0
        object grpMesAnoRef: TGroupBox
          Left = 16
          Top = 8
          Width = 241
          Height = 49
          Caption = ' A partir de: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object cmbMesCob: TComboBox
            Left = 16
            Top = 18
            Width = 145
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro '
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object spedAnoCob: TSpinEdit
            Left = 160
            Top = 18
            Width = 63
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 4
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 1998
          end
        end
        object bbtnProcurar: TBitBtn
          Left = 464
          Top = 16
          Width = 101
          Height = 33
          Hint = 'Procurar participante(s)'
          Caption = '&Procurar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnProcurarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
      end
      object rgOpcao: TRadioGroup
        Left = 0
        Top = 0
        Width = 732
        Height = 40
        Align = alTop
        Caption = ' Executar acerto selecionando... '
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Participante'
          'Patrocinadora / Plano')
        TabOrder = 1
        OnClick = rgOpcaoClick
      end
    end
    object plnbottom: TPanel
      Left = 1
      Top = 207
      Width = 732
      Height = 229
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 28
        Width = 732
        Height = 201
        Selected.Strings = (
          'MATRICULA'#9'13'#9'Matrícula'
          'NOME'#9'34'#9'Nome'
          'PLANO'#9'25'#9'Plano'
          'PATRO'#9'25'#9'Patrocinadora'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsAuxInsere
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 732
        Height = 28
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Participante(s)'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object btnExcluir: TBitBtn
          Left = 680
          Top = 3
          Width = 25
          Height = 23
          Hint = 'Retirar da lista'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnExcluirClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888FF8888888888888778888888888888F77F8888888888800F08
            8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
            88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
            08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
            F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
            FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
            788877FF7FF778F7788889999991777888888777777787788888889999988888
            8888887777788888888888888888888888888888888888888888}
          NumGlyphs = 2
        end
        object btnIncluir: TBitBtn
          Left = 705
          Top = 3
          Width = 25
          Height = 23
          Hint = 'Incluir na lista'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnIncluirClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888F88888888888888778888888888888F77F8888888888800F08
            8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
            88888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFCCCFFF
            08888887FF77788F7F88888B7FFFFFCF088888F77F88FF7878F88B8B7BFCCCFF
            F088878778F77788F78F888B87FFFFFCFF0888F7F7F88FF788788BBBBBFFCCCF
            FFF08777778F777888F7888B887FFFFFF77888F7F878F888F7788B8B8B87FFF7
            78888787F7878FF77888888B8888777888888887888877788888888888888888
            8888888888888888888888888888888888888888888888888888}
          NumGlyphs = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 437
    Width = 734
    inherited tb97Fundo: TToolbar97
      Left = 547
      DockPos = 547
      TabOrder = 2
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 262
      DockPos = 262
      TabOrder = 1
      inherited ToolbarSep971: TToolbarSep97
        Left = 97
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 97
        Caption = '&Processar'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 100
        Width = 84
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
    object bbtnAtReserva: TBitBtn
      Left = 164
      Top = 2
      Width = 97
      Height = 33
      Caption = 'At. &Reserva'
      Default = True
      TabOrder = 0
      OnClick = bbtnAtReservaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Cells'
        0))
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ELEGIVEL'
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PARTPREVPLAN.IDPLANOPREV'
      'PLANPREV.NOME'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA           = ELEGIVEL.IDPESSOA'
      'ELEGIVEL.IDPESSOA         = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA        = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR       = PARTPREVPLAN.IDPESSJUR'
      'PATRO.IDPESSOA            = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV  = PLANPREV.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '8'
      '25'
      '25')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 403
    Top = 144
  end
  object qryAuxInsere: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ELP.IDPESSJUR, ELP.IDPESSOA, PPP.IDPLANOPREV,'
      '  ELP.MATRICULA, PES.NOME, PPP.SEQPROPOSTA,'
      ''
      '  PLP.NOME AS PLANO,'
      '  PTR.NOME AS PATRO'
      ''
      ''
      'FROM'
      '  PESSOA       PES,'
      '  PARTPREVPLAN PPP,'
      '  ELEGPATRO    ELP,'
      '  PLANPREV     PLP,'
      '  PESSOA       PTR'
      ''
      'WHERE'
      '      PES.IDPESSOA    = -1'
      '  AND ELP.IDPESSJUR   = ELP.IDPESSJUR'
      '  AND ELP.IDPESSOA    = PES.IDPESSOA'
      '  AND PPP.IDPESSJUR   = ELP.IDPESSJUR'
      '  AND PPP.IDPLANOPREV = PPP.IDPLANOPREV'
      '  AND PPP.IDPESSOA    = ELP.IDPESSOA'
      '  AND ELP.IDPESSJUR   = PTR.IDPESSOA'
      '  AND PPP.IDPLANOPREV = PLP.IDPLANOPREV')
    UpdateObject = updAuxInsere
    ValidateWithMask = True
    Left = 152
    Top = 280
  end
  object updAuxInsere: TUpdateSQL
    ModifySQL.Strings = (
      '')
    InsertSQL.Strings = (
      'insert into ELEGPATRO'
      '  (idpessjur , idpessoa )'
      'values'
      '  (:idpessjur, :idpessoa)')
    DeleteSQL.Strings = (
      'delete ELEGPATRO'
      'WHERE IDPESSJUR = :OLD_IDPESSJUR AND'
      'IDPESSOA = :OLD_IDPESSOA  ')
    Left = 152
    Top = 264
  end
  object dsAuxInsere: TwwDataSource
    AutoEdit = False
    DataSet = qryAuxInsere
    Left = 152
    Top = 248
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 312
    Top = 144
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PA.IDPESSOA, PE.NOME'
      'FROM PESSOA PE, PATRO PA'
      'WHERE PE.IDPESSOA = PA.IDPESSOA')
    ValidateWithMask = True
    Left = 240
    Top = 280
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.IDPLANOPREV, PL.NOME'
      'FROM PATRO PA, PLANPREVPATRO PP, PLANPREV PL'
      'WHERE PA.IDPESSOA = :IDPESSOA'
      '  AND PA.IDPESSOA = PP.IDPESSJUR'
      '  AND PP.IDPLANOPREV = PL.IDPLANOPREV')
    ValidateWithMask = True
    Left = 240
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPatroPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  EL.MATRICULA, PE.NOME, PP.INSCRICAONUMERO, PA.NOME NOMEPATRO, ' +
        'EL.IDPESSOA,'
      '  EL.IDPESSJUR, PP.IDPLANOPREV, PL.NOME PLANO, PP.SEQPROPOSTA'
      ''
      'FROM'
      '  PESSOA       PE,'
      '  PESSOA       PA,'
      '  ELEGPATRO    EL,'
      '  PARTPREVPLAN PP,'
      '  PLANPREV     PL'
      'WHERE'
      '      ( EL.IDPESSJUR     = :IDPESSJUR     )'
      '  AND ( EL.IDPESSOA      = PE.IDPESSOA    )'
      '  AND ( EL.IDPESSOA      = PP.IDPESSOA    )'
      '  AND ( EL.IDPESSJUR     = PP.IDPESSJUR   )'
      '  AND ( EL.IDPESSJUR     = PA.IDPESSOA    )'
      '  AND ( PA.IDPESSOA      = EL.IDPESSJUR   )'
      '  AND ( PP.IDPESSOA      = EL.IDPESSOA    )'
      '  AND ( PP.IDPESSJUR     = EL.IDPESSJUR   )'
      '  AND ( PP.IDPLANOPREV   = PL.IDPLANOPREV )'
      '  AND ( PP.FLGDESATIVADO = 0              )'
      '  AND ( PP.IDPLANOPREV   = :IDPLANOPREV   )')
    ValidateWithMask = True
    Left = 240
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
end
