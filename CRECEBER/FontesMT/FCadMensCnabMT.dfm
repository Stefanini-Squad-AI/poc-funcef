inherited FrmCadMensCnabMT: TFrmCadMensCnabMT
  Left = 101
  Top = 97
  HelpContext = 40038
  Caption = 'Documentos X Mensagens'
  ClientHeight = 391
  ClientWidth = 573
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 573
    Height = 305
    object RgMens: TRadioGroup
      Left = 11
      Top = 8
      Width = 556
      Height = 90
      Caption = ' Aplica a Mensagem para '
      ItemIndex = 0
      Items.Strings = (
        'Documento Específico'
        'Documentos Pendentes')
      TabOrder = 2
      OnClick = RgMensClick
    end
    object NtbAplicaMens: TNotebook
      Left = 176
      Top = 16
      Width = 387
      Height = 78
      TabOrder = 3
      object TPage
        Left = 0
        Top = 0
        Caption = 'DocEspecifico'
        object Label1: TLabel
          Left = 9
          Top = 3
          Width = 87
          Height = 13
          Caption = 'Nº  Documento'
        end
        object Label2: TLabel
          Left = 9
          Top = 39
          Width = 76
          Height = 13
          Caption = 'Razão Social'
        end
        object btnProc: TSpeedButton
          Left = 155
          Top = 15
          Width = 26
          Height = 23
          Hint = 'Selecinar   Documento'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
            333337333333373F333307F8F8F8F70333337F333333337F333307F8F8F8F703
            33337F333333337F333307F8F8F8F703333373F3333333733333778F8F8F8773
            333337F3333337F333333078F8F870333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnProcClick
        end
        object EdNumDoc: TEdit
          Left = 9
          Top = 16
          Width = 145
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object EdRazao: TEdit
          Left = 9
          Top = 52
          Width = 368
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object CkbMens: TCheckBox
          Left = 188
          Top = 17
          Width = 190
          Height = 17
          Caption = 'Apaga Mensagens Existentes'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'AllDocs'
        object LblNumDocs: TLabel
          Left = 10
          Top = 55
          Width = 190
          Height = 13
          Caption = 'Total de Documentos Pendentes:'
          WordWrap = True
        end
        object LblTotDoc: TLabel
          Left = 202
          Top = 55
          Width = 8
          Height = 13
          Caption = '0'
        end
        object Label3: TLabel
          Left = 11
          Top = 5
          Width = 102
          Height = 13
          Caption = 'Tipo de Cobrança'
        end
        object Label4: TLabel
          Left = 199
          Top = 5
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object DbLcPortador: TwwDBLookupCombo
          Left = 10
          Top = 21
          Width = 176
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Descrição')
          LookupTable = cdsBanco
          LookupField = 'CODPORTFORMA'
          Options = [loTitles]
          DropDownWidth = 400
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DbLcPortadorCloseUp
        end
        object CmbTipoDoc: TwwDBLookupCombo
          Left = 198
          Top = 21
          Width = 178
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          LookupTable = cdsTipoDoc
          LookupField = 'CODTIPDOC'
          Options = [loTitles]
          DropDownWidth = 400
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DbLcPortadorCloseUp
        end
      end
    end
    object Pnldocpendentes: TPanel
      Left = 5
      Top = 101
      Width = 565
      Height = 30
      BevelInner = bvLowered
      BevelWidth = 2
      Caption = 'Mensagem a ser Impressa - Máximo de  9 Linhas'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 0
    end
    object MemoDesc: TMemo
      Left = 5
      Top = 130
      Width = 565
      Height = 169
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Pitch = fpFixed
      Font.Style = []
      MaxLength = 700
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 573
  end
  inherited Dock971: TDock97
    Top = 352
    Width = 573
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 40038
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 131
    Top = 219
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 316
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 249
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 531
    Top = 6
  end
  inherited Cds: TCMClientDataSet
    Left = 284
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAEMISSAO'
      'DOCUMENTO.DATAPROGRAMADA'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D'
      'C')
    Descricao.Strings = (
      'Documento'
      'Complemento'
      'Data de Emissão'
      'Data Programada'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DOCUMENTO'
      'PESSOA'
      'MENSAGENSCNAB')
    CamposChave.Strings = (
      'MENSAGENSCNAB.IDMENSAGENSCNAB'
      'DOCUMENTO.NODOCUMENTO'
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.CODDOCUMENTO'
      'DOCUMENTO.CODGRUPOCNAB')
    Filtro.Strings = (
      'DOCUMENTO.STATUS <> '#39'2'#39
      'RTRIM(DOCUMENTO.OPERACAO)  IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'14'#39')'
      'DOCUMENTO.RECPAG = '#39'R'#39
      'DOCUMENTO.EMISBLOQ = '#39'N'#39
      'DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA'
      
        '(DOCUMENTO.CODDOCUMENTO = MENSAGENSCNAB.CODDOCUMENTO) OR ( DOCUM' +
        'ENTO.CODGRUPOCNAB = MENSAGENSCNAB.CODGRUPOCNAB)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '3'
      '10'
      '10'
      '60')
    Left = 468
    Top = 14
  end
  object MonSelProc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAEMISSAO'
      'DOCUMENTO.DATAPROGRAMADA'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D'
      'C')
    Descricao.Strings = (
      'Documento'
      'Complemento'
      'Data de Emissão'
      'Data Programada'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DOCUMENTO'
      'PESSOA')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'DOCUMENTO.NODOCUMENTO'
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.CODGRUPOCNAB')
    Filtro.Strings = (
      'DOCUMENTO.STATUS <> '#39'2'#39
      'RTRIM(DOCUMENTO.OPERACAO)  IN ('#39'1'#39','#39'2'#39','#39'3'#39')'
      'DOCUMENTO.RECPAG = '#39'R'#39
      'DOCUMENTO.EMISBLOQ = '#39'N'#39
      'DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '3'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 420
    Top = 6
  end
  object sqlBanco: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  PF.CODPORTFORMA, PF.DESCRICAO, PF.CODBLOQCHE, PF.CODARQUIVOREM' +
        'ESSA, PF.NOSSONUMERO,'
      
        '  PF.JUROSPORDIA,  PF.PRAZOPROTESTO, PF.NUMEMPRESABANCO, PF.PATH' +
        'ARQUIVOREM, PC.CONTROLEREMESSA'
      'FROM'
      '  PORTADORFORMA PF, PORTADORCONTA PC'
      'WHERE'
      '  PC.CODPORTADOR = PF.CODPORTADOR AND'
      '  PF.RECPAG = :PRecPag AND'
      '  PF.IDPESSOA = :PIDPessoa'
      'Order by PF.DESCRICAO'
      ' '
      ' ')
    ClientDataSet = cdsBanco
    Left = 90
    Top = 247
  end
  object cdsBanco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 90
    Top = 277
  end
  object sqlTipoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODTIPDOC, DESCRICAO'
      'FROM'
      '  TIPODOCRECPAG A'
      'WHERE'
      '  A.RECPAG = :pRECPAG'
      '  AND NOT EXISTS'
      '    (SELECT 1 FROM USUARIOxTPDOCTO B'
      '     WHERE B.IDUSUARIO = :pIDUSUARIO'
      '           AND RECPAG  = :pRECPAG)'
      '     UNION'
      '     SELECT CODTIPDOC,DESCRICAO'
      '     FROM TIPODOCRECPAG A'
      '     WHERE A.RECPAG = :pRECPAG'
      '           AND EXISTS'
      '    (SELECT 1 FROM USUARIOxTPDOCTO B'
      '     WHERE A.CODTIPDOC = B.CODTIPDOC'
      '          AND B.IDUSUARIO = :pIDUSUARIO'
      '          AND RECPAG = :pRECPAG)'
      'ORDER BY DESCRICAO'
      ''
      ''
      ' '
      ' ')
    ClientDataSet = cdsTipoDoc
    Left = 60
    Top = 247
  end
  object cdsTipoDoc: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 60
    Top = 277
    Data = {
      6F0000009619E0BD0100000018000000020000000000030000006F0009434F44
      544950444F4308000400000000000944455343524943414F0100490000000100
      05574944544802000200230002000D44454641554C545F4F5244455202008200
      010000000200044C4349440400010009080000}
  end
  object cdsBloquete: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 180
    Top = 277
  end
end
