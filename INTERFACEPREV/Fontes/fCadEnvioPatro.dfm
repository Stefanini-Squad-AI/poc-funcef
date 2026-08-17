inherited frmCadEnvioPatro: TfrmCadEnvioPatro
  Left = 372
  Top = 135
  HelpContext = 320003
  Caption = 'Cadastro de Lay-Out de Arquivos de Envio para Patrocinadora'
  ClientHeight = 457
  ClientWidth = 703
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 703
    Height = 371
    inherited pnlMestre: TPanel
      Width = 701
      Height = 60
      object Label1: TLabel
        Left = 9
        Top = 10
        Width = 124
        Height = 13
        Caption = 'Descrição do Lay-Out'
      end
      object DbeDescricao: TwwDBEdit
        Left = 8
        Top = 26
        Width = 672
        Height = 21
        Color = clWhite
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 61
      Width = 701
      Height = 309
      inherited pgctrlDetalhe: TPageControl
        Width = 603
        Height = 250
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 595
            Height = 222
            Selected.Strings = (
              'IDENTIFICADOR'#9'5'#9'Id.'
              'ORDEM'#9'5'#9'Ordem'
              'DESCRICAO'#9'50'#9'Descrição'
              'TAMANHO'#9'5'#9'Tam.'
              'FORMATO'#9'10'#9'Formato'
              'CONTEUDO'#9'30'#9'Conteúdo'
              'CAMPO'#9'60'#9'Campo'#9'F'
              'TIPO'#9'20'#9'Tipo'
              'LINHA'#9'10'#9'Linha')
            FixedCols = 2
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 595
            Height = 222
            object pnlControles: TPanel
              Left = 0
              Top = 0
              Width = 595
              Height = 222
              Align = alClient
              BevelInner = bvLowered
              BevelOuter = bvNone
              TabOrder = 0
              TabStop = True
              object Ordem: TLabel
                Left = 8
                Top = 57
                Width = 37
                Height = 13
                Caption = 'Ordem'
              end
              object Tipo: TLabel
                Left = 8
                Top = 104
                Width = 26
                Height = 13
                Caption = 'Tipo'
              end
              object Label4: TLabel
                Left = 8
                Top = 173
                Width = 55
                Height = 13
                Caption = 'Conteúdo'
              end
              object Tamanho: TLabel
                Left = 8
                Top = 127
                Width = 53
                Height = 13
                Caption = 'Tamanho'
              end
              object Label3: TLabel
                Left = 8
                Top = 33
                Width = 72
                Height = 13
                Caption = 'Identificador'
              end
              object Label5: TLabel
                Left = 8
                Top = 197
                Width = 58
                Height = 13
                Caption = 'Descrição'
                WordWrap = True
              end
              object Label6: TLabel
                Left = 8
                Top = 11
                Width = 32
                Height = 13
                Caption = 'Linha'
              end
              object Formato: TLabel
                Left = 10
                Top = 150
                Width = 46
                Height = 13
                Caption = 'Formato'
              end
              object Label10: TLabel
                Left = 8
                Top = 81
                Width = 39
                Height = 13
                Caption = 'Campo'
              end
              object dblookupTipo: TwwDBComboBox
                Left = 84
                Top = 100
                Width = 283
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = False
                AllowClearKey = False
                DataField = 'TIPO'
                DataSource = dsDet
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'Numerico '
                  'String'
                  'Data '
                  'Constante'
                  'zerados'
                  'noves'
                  'vazios')
                Sorted = False
                TabOrder = 4
                UnboundDataType = wwDefault
                OnCloseUp = dblookupTipoCloseUp
              end
              object dbIdentificador: TwwDBEdit
                Left = 84
                Top = 31
                Width = 121
                Height = 21
                DataField = 'IDENTIFICADOR'
                DataSource = dsDet
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnExit = dbIdentificadorExit
              end
              object dbDescricao: TwwDBEdit
                Left = 83
                Top = 192
                Width = 500
                Height = 21
                DataField = 'DESCRICAO'
                DataSource = dsDet
                TabOrder = 8
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbFormato: TwwDBEdit
                Left = 84
                Top = 146
                Width = 121
                Height = 21
                DataField = 'FORMATO'
                DataSource = dsDet
                TabOrder = 6
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbLinha: TwwDBComboBox
                Left = 84
                Top = 8
                Width = 121
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = False
                DataField = 'LINHA'
                DataSource = dsDet
                DropDownCount = 8
                ItemHeight = 0
                Items.Strings = (
                  'Cabeçalho'#9'0'
                  'Detalhe'#9'1'
                  'Rodapé'#9'2')
                Sorted = False
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object dbConteudo: TwwDBEdit
                Left = 83
                Top = 169
                Width = 500
                Height = 21
                DataField = 'CONTEUDO'
                DataSource = dsDet
                TabOrder = 7
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dbTamanho: TDBRealEdit
                Left = 84
                Top = 123
                Width = 121
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0')
                TabOrder = 5
                WordWrap = False
                OnExit = dbTamanhoExit
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fFixed
                Signal = False
                DataField = 'TAMANHO'
                DataSource = dsDet
              end
              object dbOrdem: TDBRealEdit
                Left = 84
                Top = 54
                Width = 121
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0')
                TabOrder = 2
                WordWrap = False
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fFixed
                Signal = False
                DataField = 'ORDEM'
                DataSource = dsDet
              end
              object dblookupCampo: TCMDBLookupCombo
                Left = 84
                Top = 77
                Width = 283
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Nome')
                DataField = 'IDCAMPO'
                DataSource = dsDet
                LookupTable = qryCampos
                LookupField = 'IDCAMPO'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
                OnChange = dblookupCampoChange
              end
              object dbckValor: TDBCheckBox
                Left = 211
                Top = 126
                Width = 73
                Height = 17
                Caption = 'É valor.'
                DataField = 'FLGVALOR'
                DataSource = dsDet
                TabOrder = 9
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = dbckValorClick
              end
              object dbckSeparador: TDBCheckBox
                Left = 211
                Top = 150
                Width = 156
                Height = 17
                Caption = 'Usa separador decimal.'
                DataField = 'FLGSEPARADOR'
                DataSource = dsDet
                TabOrder = 10
                ValueChecked = '1'
                ValueUnchecked = '0'
                Visible = False
              end
              object btFormato: TButton
                Left = 366
                Top = 146
                Width = 23
                Height = 21
                Caption = '?'
                TabOrder = 11
                Visible = False
                OnClick = btFormatoClick
              end
              object rdgrpcompletanum: TDBRadioGroup
                Left = 370
                Top = 88
                Width = 218
                Height = 47
                DataField = 'FLGCOMPBRANCOS'
                DataSource = dsDet
                Items.Strings = (
                  'Completa c/brancos à esquerda.'
                  'Completa c/zeros à esquerda.')
                TabOrder = 12
                Values.Strings = (
                  '1'
                  '0')
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 693
      end
      inherited Dock974: TDock97
        Left = 607
        Height = 250
      end
      object mmFormato: TMemo
        Left = 100
        Top = 265
        Width = 270
        Height = 235
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Courier'
        Font.Pitch = fpFixed
        Font.Style = [fsBold]
        Lines.Strings = (
          'Formato  Ação'
          '9        utiliza o próximo'
          '         caracter numérico'
          'X        utiliza o caracter'
          '         atual'
          '0        pula o caracter'
          '         atual'
          'outro    acrescenta o'
          '         caracter'
          '         especificado no'
          '         formato, sem'
          '         avançar o campo'
          'Exemplo:'
          'Formato  Matrícula Resultado'
          '999990X  00100--   00100-'
          '99999XX  00100--   00100--'
          '99999-9  001008    00100-8'
          ' '
          ' ')
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Visible = False
        OnExit = mmFormatoExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 703
  end
  inherited Dock971: TDock97
    Top = 418
    Width = 703
    inherited tb97Fundo: TToolbar97
      Left = 531
      DockPos = 571
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 362
      DockPos = 386
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 262
    Top = 108
    TargetsData = (
      1
      4
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 482
    Top = 138
  end
  inherited ds: TwwDataSource
    Left = 392
    Top = 52
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LAYOUTENVIO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  TIPO = :TIPO'
      'where'
      '  IDLAYOUTENVIO = :OLD_IDLAYOUTENVIO'
      ' ')
    InsertSQL.Strings = (
      'insert into LAYOUTENVIO'
      '  (IDLAYOUTENVIO, DESCRICAO, TIPO)'
      'values'
      '  (:IDLAYOUTENVIO, :DESCRICAO, :TIPO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from LAYOUTENVIO'
      'where'
      '  IDLAYOUTENVIO = :OLD_IDLAYOUTENVIO')
    Left = 424
    Top = 52
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona layout de envio'
    Colunas.Strings = (
      'LAYOUTENVIO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Layout')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CM.LAYOUTENVIO')
    CamposChave.Strings = (
      'LAYOUTENVIO.IDLAYOUTENVIO')
    Filtro.Strings = (
      '((TIPO = '#39'E'#39') OR (TIPO = NULL))')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    ExibePergunta = False
    Left = 329
    Top = 108
  end
  inherited ImlPadrao: TImageList
    Left = 295
    Top = 108
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 298
    Top = 52
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT'
      '  IDLAYOUTENVIO, DESCRICAO, TIPO'
      'FROM'
      '  CM.LAYOUTENVIO'
      'WHERE'
      '  IDLAYOUTENVIO = :IDLAYOUTENVIO'
      'AND ((TIPO = '#39'E'#39') OR (TIPO IS NULL)) '
      ' ')
    Left = 359
    Top = 52
    ParamData = <
      item
        DataType = ftInterface
        Name = 'IDLAYOUTENVIO'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 226
    Top = 218
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PARAMENVIO.IDLAYOUTENVIO, PARAMENVIO.SEQUENCIA,'
      '  PARAMENVIO.ORDEM,     PARAMENVIO.TIPO,'
      
        '  PARAMENVIO.IDCAMPO,'#9'PARAMENVIO.CONTEUDO,'#9'PARAMENVIO.TAMANHO,  ' +
        'PARAMENVIO.IDENTIFICADOR,'
      '  PARAMENVIO.DESCRICAO,'#9'PARAMENVIO.LINHA,'#9'PARAMENVIO.FORMATO,'
      '  PARAMENVIO.FLGVALOR,  PARAMENVIO.FLGSEPARADOR,'
      '  NVL(PARAMENVIO.FLGCOMPBRANCOS,0) FLGCOMPBRANCOS,'
      ''
      '  CAMPOINTERFENVIO.NOME'#9'AS CAMPO'
      ''
      'FROM'
      '  PARAMENVIO, CAMPOINTERFENVIO'
      ''
      'WHERE'
      '  (PARAMENVIO.IDLAYOUTENVIO = :IDLAYOUTENVIO)   AND'
      '  (PARAMENVIO.IDCAMPO       = CAMPOINTERFENVIO.IDCAMPO)'
      'ORDER BY'
      '  IDENTIFICADOR, ORDEM'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 451
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUTENVIO'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMENVIO'
      'set'
      '  SEQUENCIA = :SEQUENCIA,'
      '  ORDEM = :ORDEM,'
      '  TIPO = :TIPO,'
      '  IDCAMPO = :IDCAMPO,'
      '  CONTEUDO = :CONTEUDO,'
      '  TAMANHO = :TAMANHO,'
      '  IDENTIFICADOR = :IDENTIFICADOR,'
      '  DESCRICAO = :DESCRICAO,'
      '  LINHA = :LINHA,'
      '  FORMATO = :FORMATO,'
      '  FLGVALOR = :FLGVALOR,'
      '  FLGSEPARADOR = :FLGSEPARADOR,'
      '  IDLAYOUTENVIO = :IDLAYOUTENVIO,'
      '  FLGCOMPBRANCOS = :FLGCOMPBRANCOS'
      'where'
      '  IDLAYOUTENVIO = :OLD_IDLAYOUTENVIO and'
      '  ORDEM = :OLD_ORDEM and'
      '  IDCAMPO = :OLD_IDCAMPO and'
      '  IDENTIFICADOR = :OLD_IDENTIFICADOR'
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into PARAMENVIO'
      '  (SEQUENCIA, ORDEM, TIPO, IDCAMPO, CONTEUDO, TAMANHO, '
      'IDENTIFICADOR, DESCRICAO, '
      '   LINHA, FORMATO, FLGVALOR, FLGSEPARADOR, IDLAYOUTENVIO,'
      'FLGCOMPBRANCOS)'
      'values'
      '  (:SEQUENCIA, :ORDEM, :TIPO, :IDCAMPO, :CONTEUDO, :TAMANHO,'
      ':IDENTIFICADOR,'
      
        '   :DESCRICAO, :LINHA, :FORMATO, :FLGVALOR, :FLGSEPARADOR, :IDLA' +
        'YOUTENVIO,'
      ':FLGCOMPBRANCOS)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from PARAMENVIO'
      'where'
      '  IDLAYOUTENVIO = :OLD_IDLAYOUTENVIO and'
      '  ORDEM = :OLD_ORDEM and'
      '  IDCAMPO = :OLD_IDCAMPO and'
      '  IDENTIFICADOR = :OLD_IDENTIFICADOR')
    Left = 513
    Top = 146
  end
  object qryCampos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'IDCAMPO,'
      #9'NOME'
      ''
      'FROM'#9'CAMPOINTERFENVIO'
      'WHERE  ((TIPO = '#39'E'#39') OR (TIPO IS NULL))'
      'ORDER'#9'BY NOME'
      ' ')
    ControlType.Strings = (
      'NOME;CustomEdit;')
    ValidateWithMask = True
    Left = 443
    Top = 332
    object qryCamposIDCAMPO: TFloatField
      FieldName = 'IDCAMPO'
      Origin = 'CAMPOINTERFENVIO.IDCAMPO'
    end
    object qryCamposNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'CAMPOINTERFENVIO.NOME'
      Size = 60
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 498
    Top = 52
  end
end
