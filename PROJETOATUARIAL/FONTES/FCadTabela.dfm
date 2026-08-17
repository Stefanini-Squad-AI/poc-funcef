inherited frmCadTbCampos: TfrmCadTbCampos
  Left = 222
  Top = 121
  Caption = 'Cadastro de tabelas'
  ClientHeight = 351
  ClientWidth = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 390
    Height = 265
    object Label1: TLabel
      Left = 11
      Top = 18
      Width = 290
      Height = 13
      Caption = 'Grupo de Tabelas  Existentes - Selecione um deles'
    end
    object dbeditgrupo: TwwDBLookupCombo
      Left = 13
      Top = 36
      Width = 337
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODGRUPOARQUIVO'#9'6'#9'Código do Grupo'
        'DESCGRUPOARQUIVO'#9'40'#9'Descrição do Grupo')
      LookupTable = qrygrupo
      LookupField = 'CODGRUPOARQUIVO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 83
      Width = 380
      Height = 177
      ActivePage = TabSheet1
      Align = alBottom
      HotTrack = True
      MultiLine = True
      ScrollOpposite = True
      TabOrder = 1
      TabStop = False
      object TabSheet1: TTabSheet
        Caption = 'Cadastro de Tabelas'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 372
          Height = 149
          Align = alClient
          BorderStyle = bsSingle
          TabOrder = 0
          object Label9: TLabel
            Left = 8
            Top = 81
            Width = 171
            Height = 13
            Caption = 'Data da Avaliação (ano/mês) '
          end
          object Label2: TLabel
            Left = 8
            Top = 22
            Width = 94
            Height = 13
            Caption = 'Nome da Tabela'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbeAvaliacao: TwwDBEdit
            Left = 8
            Top = 98
            Width = 70
            Height = 21
            DataField = 'AVALIACAO'
            DataSource = ds
            MaxLength = 6
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeTabela: TwwDBEdit
            Left = 8
            Top = 39
            Width = 329
            Height = 21
            DataField = 'DESCRICAO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Referências'
        object Soleitura: TPanel
          Left = 0
          Top = 0
          Width = 372
          Height = 149
          Align = alClient
          BorderStyle = bsSingle
          TabOrder = 0
          object Label5: TLabel
            Left = 227
            Top = 22
            Width = 101
            Height = 13
            Caption = 'Código da Tabela'
          end
          object Label6: TLabel
            Left = 8
            Top = 22
            Width = 150
            Height = 13
            Caption = 'Data de Criação da tabela'
          end
          object Label3: TLabel
            Left = 8
            Top = 81
            Width = 91
            Height = 13
            Caption = 'Massa do Plano'
          end
          object dbeDataCriacao: TwwDBEdit
            Left = 8
            Top = 39
            Width = 89
            Height = 21
            DataField = 'DATACRIACAO'
            DataSource = ds
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeIdTabela: TwwDBEdit
            Left = 228
            Top = 39
            Width = 101
            Height = 21
            DataField = 'IDTABELA'
            DataSource = ds
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeMassaPlano: TwwDBEdit
            Left = 8
            Top = 98
            Width = 121
            Height = 21
            DataField = 'MASSAPLANO'
            DataSource = ds
            ReadOnly = True
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 312
    Width = 390
    inherited tb97Fundo: TToolbar97
      Left = 220
      DockPos = 220
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 52
      DockPos = 52
    end
  end
  inherited Dock972: TDock97
    Width = 390
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'#9'TB.IDTABELA,'
      #9'TB.DESCRICAO,'
      #9'TB.DATACRIACAO,'
      #9'TB.AVALIACAO,'
      #9'TB.IDPLANOPREV,'
      #9'TB.MASSAPLANO'
      ''
      'FROM'#9'CM.TBPARTICIP'#9'TB'
      'WHERE'#9'TB.IDTABELA'#9'=:pIDTABELA'
      ''
      'ORDER'#9'BY TB.DATACRIACAO'
      '')
    Params.Data = {0100010009704944544142454C4100030400000000000100}
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.TBPARTICIP'
      'set'
      '  IDTABELA = :IDTABELA,'
      '  DESCRICAO = :DESCRICAO,'
      '  DATACRIACAO = :DATACRIACAO,'
      '  AVALIACAO = :AVALIACAO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  MASSAPLANO = :MASSAPLANO'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    InsertSQL.Strings = (
      'insert into CM.TBPARTICIP'
      
        '  (IDTABELA, DESCRICAO, DATACRIACAO, AVALIACAO, IDPLANOPREV, MAS' +
        'SAPLANO)'
      'values'
      
        '  (:IDTABELA, :DESCRICAO, :DATACRIACAO, :AVALIACAO, :IDPLANOPREV' +
        ', :MASSAPLANO)')
    DeleteSQL.Strings = (
      'delete from CM.TBPARTICIP'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TBPARTICIP.DESCRICAO'
      'TBPARTICIP.DATACRIACAO'
      'TBPARTICIP.MASSAPLANO'
      'TBPARTICIP.AVALIACAO'
      'TBPARTICIP.IDTABELA')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Descrição da Tabela'
      'Data de Criação'
      'Código do Grupo'
      'Data de Avaliação'
      'Código da Tabela')
    Tabelas.Strings = (
      'TBPARTICIP')
    CamposChave.Strings = (
      'TBPARTICIP.IDTABELA'
      'TBPARTICIP.DESCRICAO'
      'TBPARTICIP.DATACRIACAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '80'
      '10'
      '50'
      '6'
      '10')
    DataBaseName = 'BASEDADOS'
    Left = 349
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrygrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  CODGRUPOARQUIVO, '
      '                DESCGRUPOARQUIVO'
      ''
      'FROM      GRPARQUIVO'
      ''
      'WHERE  SETORGRUPOS='#39'ASSDES'#39
      ''
      'ORDER BY DESCGRUPOARQUIVO'
      ''
      '')
    ValidateWithMask = True
    Left = 24
    Top = 79
  end
  object qryCampos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT    IDTABELA , IDCAMPO, DESCRICAO,'
      '               TIPO   ,  RELACAO  '
      'FROM    TBCAMPOPART'
      'WHERE  IDTABELA =:CODTAB'
      '')
    Params.Data = {0100010006434F4454414200030400000000000000}
    UpdateObject = Updqrycampos
    ValidateWithMask = True
    Left = 322
    Top = 119
  end
  object Updqrycampos: TUpdateSQL
    ModifySQL.Strings = (
      'update TBCAMPOPART'
      'set'
      '  IDTABELA = :IDTABELA,'
      '  IDCAMPO = :IDCAMPO,'
      '  DESCRICAO = :DESCRICAO,'
      '  TIPO = :TIPO,'
      '  RELACAO = :RELACAO'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    InsertSQL.Strings = (
      'insert into TBCAMPOPART'
      '  (IDTABELA, IDCAMPO, DESCRICAO, TIPO, RELACAO)'
      'values'
      '  (:IDTABELA, :IDCAMPO, :DESCRICAO, :TIPO, :RELACAO)')
    DeleteSQL.Strings = (
      'delete from TBCAMPOPART'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    Left = 336
    Top = 135
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(IDTABELA) AS IDATUAL '
      'FROM TBPARTICIP')
    ValidateWithMask = True
    Left = 352
    Top = 55
  end
inherited CmeCadastro: TCmEventosCadastro
     OnInsert = CmeCadastroInsert
     OnDelete = CmeCadastroDelete
     OnFind = CmeCadastroFind
     OnConfirma = CmeCadastroConfirma
  Left = 358
  Top = 58
end
end
