inherited FrmCadSaidaGenerica: TFrmCadSaidaGenerica
  Left = -1
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Saída Genérica'
  ClientHeight = 621
  ClientWidth = 1017
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlFundo: TPanel
    Width = 1017
    Height = 518
    inherited pnlMestre: TPanel
      Width = 1007
      Height = 197
      object lblSql: TLabel
        Left = 4
        Top = 39
        Width = 92
        Height = 16
        Caption = 'Consulta Sql:'
      end
      object lblCodSaida: TLabel
        Left = 4
        Top = 12
        Width = 91
        Height = 16
        Caption = 'Identificador:'
      end
      object lblDescricao: TLabel
        Left = 209
        Top = 12
        Width = 76
        Height = 16
        Caption = 'Descrição:'
      end
      object memSql: TMemo
        Left = 0
        Top = 57
        Width = 841
        Height = 131
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object btnAnalisar: TBitBtn
        Left = 849
        Top = 57
        Width = 149
        Height = 50
        Anchors = [akTop, akRight]
        Caption = 'Analisar Sql'
        TabOrder = 3
        OnClick = btnAnalisarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333000003333333333F777773FF333333008877700
          33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
          703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
          77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
          07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
          780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
          8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
          3333333773FFFF77333333333000003333333333377777333333}
        NumGlyphs = 2
      end
      object dbeIdSaida: TwwDBEdit
        Left = 101
        Top = 8
        Width = 86
        Height = 24
        DataField = 'IDSAIDA'
        DataSource = ds
        Enabled = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDescricao: TwwDBEdit
        Left = 293
        Top = 8
        Width = 700
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 202
      Width = 1007
      Height = 311
      inherited pgctrlDetalhe: TPageControl
        Width = 889
        Height = 243
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 881
            Height = 212
            Selected.Strings = (
              'IDCOMPONENTE'#9'16'#9'Num, Compoenente'
              'NOMECOMPONENTE'#9'32'#9'Nome'
              'CARACTERISTICA'#9'12'#9'Característica'
              'TIPO'#9'5'#9'Tipo'
              'POSICAOINICIAL'#9'13'#9'Posição Inicial'
              'MASCARASAIDA'#9'23'#9'Máscara de Saída')
          end
          inherited pnlControlesDet: TPanel
            Width = 881
            Height = 212
            object lblCampo: TLabel
              Left = 99
              Top = 12
              Width = 54
              Height = 16
              Caption = 'Campo:'
            end
            object lblCaracteristica: TLabel
              Left = 20
              Top = 80
              Width = 101
              Height = 16
              Caption = 'Característica:'
            end
            object Label1: TLabel
              Left = 69
              Top = 114
              Width = 37
              Height = 16
              Caption = 'Tipo:'
            end
            object fclblMascara: TfcLabel
              Left = 296
              Top = 16
              Width = 504
              Height = 189
              Caption = 
                'Máscara de Saída - Exemplos para cada tipo:'#13#10'  Data: dd/mm/yyyy ' +
                'ou mm/dd/yy'#13#10'  Número: inteiro com 4 dígitos com zeros a esquerd' +
                'a -> 0000  '#13#10'          inteiro com 4 dígitos com brancos a esque' +
                'rda -> 9999'#13#10'          número com 2 decimais e zeros a esquerda ' +
                '-> 0.000,00'#13#10'  Texto: texto com 40 caracteres com brancos a esqu' +
                'erda -> E40 '#13#10'         texto com 40 caracteres com brancos a esq' +
                'uerda -> D40 '#13#10'         texto com 40 caracteres com zeros a esqu' +
                'erda -> EZ40 '#13#10'         texto com 40 caracteres com zeros a esqu' +
                'erda -> DZ40 '#13#10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.VAlignment = vaTop
            end
            object Label2: TLabel
              Left = 95
              Top = 148
              Width = 62
              Height = 16
              Hint = 'Posição do campo no arquivo de saída gerado'
              Caption = 'Posição:'
              ParentShowHint = False
              ShowHint = True
            end
            object lblNome: TLabel
              Left = 8
              Top = 46
              Width = 46
              Height = 16
              Caption = 'Nome:'
            end
            object dbeComponente: TwwDBEdit
              Left = 165
              Top = 8
              Width = 86
              Height = 24
              DataField = 'IDCOMPONENTE'
              DataSource = dsDet
              Enabled = False
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbcbCaracteristica: TwwDBComboBox
              Left = 130
              Top = 76
              Width = 121
              Height = 24
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'CARACTERISTICA'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Parâmetro'#9'P'
                'Coluna'#9'C')
              Sorted = False
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object dbcbTipo: TwwDBComboBox
              Left = 113
              Top = 110
              Width = 138
              Height = 24
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = False
              DataField = 'TIPO'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Data'#9'D'
                'Número'#9'N'
                'Texto'#9'T')
              Sorted = False
              TabOrder = 2
              UnboundDataType = wwDefault
            end
            object dbeMascara: TwwDBEdit
              Left = 659
              Top = 16
              Width = 177
              Height = 24
              DataField = 'MASCARASAIDA'
              DataSource = dsDet
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbePosicao: TwwDBEdit
              Left = 165
              Top = 144
              Width = 86
              Height = 24
              DataField = 'POSICAOINICIAL'
              DataSource = dsDet
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbeNome: TwwDBEdit
              Left = 61
              Top = 42
              Width = 190
              Height = 24
              DataField = 'NOMECOMPONENTE'
              DataSource = dsDet
              Enabled = False
              TabOrder = 5
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 999
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 893
        Height = 243
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1017
  end
  inherited Dock971: TDock97
    Top = 574
    Width = 1017
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDSAIDA, SQL, DESCRICAO'
      'FROM SAIDAGENERICA'
      'WHERE IDSAIDA = :IDSAIDA '
      ' ')
    Left = 353
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDSAIDA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 363
    Top = 194
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 272
    Top = 10
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SAIDAGENERICA'
      'set'
      '  SQL = :SQL,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDSAIDA = :OLD_IDSAIDA')
    InsertSQL.Strings = (
      'insert into SAIDAGENERICA'
      '  (IDSAIDA, SQL, DESCRICAO)'
      'values'
      '  (:IDSAIDA, :SQL, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from SAIDAGENERICA'
      'where'
      '  IDSAIDA = :OLD_IDSAIDA')
    Left = 394
    Top = 10
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'S.IDSAIDA'
      'S.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código da Saída'
      'Descrição da Saída')
    SensivelACaixa.Strings = (
      'N'
      'S')
    Tabelas.Strings = (
      'SAIDAGENERICA S')
    CamposChave.Strings = (
      'S.IDSAIDA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    Left = 475
    Top = 10
  end
  inherited ds: TwwDataSource
    Left = 434
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 313
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 612
    Top = 10
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 300
    Top = 194
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 581
    Top = 180
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterOpen = qryDetAfterOpen
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT IDSAIDA, IDCOMPONENTE, NOMECOMPONENTE, CARACTERISTICA,'
      '       TIPO, MASCARASAIDA, POSICAOINICIAL'
      'FROM SAIDAGENERICADET'
      'WHERE IDSAIDA = :IDSAIDA'
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 413
    Top = 195
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDSAIDA'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update SAIDAGENERICADET'
      'set'
      '  IDCOMPONENTE = :IDCOMPONENTE,'
      '  NOMECOMPONENTE = :NOMECOMPONENTE,'
      '  CARACTERISTICA = :CARACTERISTICA,'
      '  TIPO = :TIPO,'
      '  MASCARASAIDA = :MASCARASAIDA,'
      '  POSICAOINICIAL = :POSICAOINICIAL'
      'where'
      '  IDSAIDA = :OLD_IDSAIDA')
    InsertSQL.Strings = (
      'insert into SAIDAGENERICADET'
      '  (IDSAIDA, IDCOMPONENTE, NOMECOMPONENTE, CARACTERISTICA, TIPO, '
      'MASCARASAIDA, '
      'POSICAOINICIAL)'
      'values'
      
        '  (:IDSAIDA, :IDCOMPONENTE, :NOMECOMPONENTE, :CARACTERISTICA, :T' +
        'IPO, '
      ':MASCARASAIDA, '
      ':POSICAOINICIAL)')
    DeleteSQL.Strings = (
      'delete from SAIDAGENERICADET'
      'where'
      '  IDSAIDA = :OLD_IDSAIDA')
    Left = 477
    Top = 196
  end
  object qrySQL: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 813
    Top = 188
  end
end
