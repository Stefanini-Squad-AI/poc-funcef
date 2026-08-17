inherited frmCadUnidCentr: TfrmCadUnidCentr
  Caption = 'Cadastro de Unidades Centralizadoras'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 133
        Height = 13
        Caption = 'Unidade Centralizadora'
      end
      object Label2: TLabel
        Left = 456
        Top = 8
        Width = 62
        Height = 13
        Caption = 'Percentual'
        Visible = False
      end
      object btnBuscaContrato: TBitBtn
        Left = 393
        Top = 24
        Width = 24
        Height = 21
        Hint = 'Busca um Contrato'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnBuscaContratoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
      object btnLimpaContrato: TBitBtn
        Left = 417
        Top = 24
        Width = 24
        Height = 21
        Hint = 'Limpa a seleção de Contrato'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888FF8888888888888008888888888888F77F8888888888800F08888
          8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
          88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
          888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
          0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
          03088878F88878F878788887F8888090B03088878F888787878788887888880B
          0B038888788888787878888888888880B0B38888888888878788888888888888
          0BBB88888888888878F888888888888880BB8888888888888788}
        NumGlyphs = 2
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 377
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 456
        Top = 24
        Width = 65
        Height = 21
        DataField = 'PERCENTUAL'
        DataSource = ds
        TabOrder = 3
        Visible = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      inherited pgctrlDetalhe: TPageControl
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Selected.Strings = (
              'CODESTADO'#9'7'#9'UF'
              'NOMEESTADO'#9'58'#9'Estado')
          end
          inherited pnlControlesDet: TPanel [1]
            object wwDBGrid1: TwwDBGrid
              Left = 0
              Top = 0
              Width = 502
              Height = 152
              Selected.Strings = (
                'CODESTADO'#9'7'#9'UF'#9'F'
                'NOMEESTADO'#9'58'#9'Estado'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsDet
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
          end
        end
      end
      inherited Dock973: TDock97
        object ToolbarButton971: TToolbarButton97 [0]
          Left = 146
          Top = 0
          Width = 73
          Height = 23
          Hint = 'Excluir'
          AllowAllUp = True
          Caption = '&Excluir'
          ImageIndex = 2
          Images = ImlPadrao
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnExcluiDetClick
        end
        object ToolbarButton972: TToolbarButton97 [1]
          Left = 147
          Top = 0
          Width = 73
          Height = 23
          Hint = 'Excluir'
          AllowAllUp = True
          Caption = '&Excluir'
          ImageIndex = 2
          Images = ImlPadrao
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnExcluiDetClick
        end
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Width = 74
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Left = 147
          end
        end
        object btnTodasUF: TBitBtn
          Left = 369
          Top = 3
          Width = 127
          Height = 21
          Hint = 'Busca um Contrato'
          Caption = 'Todas as UF'#39's'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
          OnClick = btnTodasUFClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
      inherited Dock974: TDock97
        object dblEstado: TwwDBLookupCombo
          Left = 8
          Top = 120
          Width = 121
          Height = 21
          DropDownAlignment = taLeftJustify
          LookupTable = qryEstado
          LookupField = 'CODESTADO'
          TabOrder = 1
          Visible = False
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = dblEstadoCloseUp
        end
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited btnRefresh: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '    UCT.IDUNIDCENTR,'
      '    UCT.PERCENTUAL,'
      '    PES.NOME'
      'FROM'
      '    EPUNDCENTR UCT,'
      '    PESSOA PES'
      'WHERE'
      
        '    ((:PIDUNIDCENTR IS NULL) OR (UCT.IDUNIDCENTR = :PIDUNIDCENTR' +
        '))'
      'AND PES.IDPESSOA = UCT.IDUNIDCENTR')
    Left = 328
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUNIDCENTR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUNIDCENTR'
        ParamType = ptInput
      end>
    object qryIDUNIDCENTR: TFloatField
      FieldName = 'IDUNIDCENTR'
      Origin = 'BASEDADOS.EPUNDCENTR.IDUNIDCENTR'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'BASEDADOS.EPUNDCENTR.PERCENTUAL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 472
    Top = 232
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update EPUNDCENTR'
      'set'
      '  PERCENTUAL = :PERCENTUAL'
      'where'
      '  IDUNIDCENTR = :OLD_IDUNIDCENTR and'
      '  PERCENTUAL = :OLD_PERCENTUAL')
    InsertSQL.Strings = (
      'insert into EPUNDCENTR'
      '  (IDUNIDCENTR, PERCENTUAL)'
      'values'
      '  (:IDUNIDCENTR, :PERCENTUAL)')
    DeleteSQL.Strings = (
      'delete from EPUNDCENTR'
      'where'
      '  IDUNIDCENTR = :OLD_IDUNIDCENTR ')
    Left = 296
    Top = 232
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'UCT.IDUNIDCENTR'
      'PES.NOME')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'ID Unidade'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'EPUNDCENTR UCT'
      'PESSOA PES')
    CamposChave.Strings = (
      'UCT.IDUNIDCENTR')
    Filtro.Strings = (
      'PES.IDPESSOA = UCT.IDUNIDCENTR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Left = 32
    Top = 200
  end
  inherited ds: TwwDataSource
    Left = 360
    Top = 232
  end
  inherited ImlPadrao: TImageList
    Left = 65512
    Top = 65486
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 134
    Top = 210
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    Left = 472
    Top = 180
  end
  object MS_Pessoa: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PES.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA PES')
    CamposChave.Strings = (
      'PES.IDPESSOA'
      'PES.NOME')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 560
    Top = 8
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   UCT.IDUNIDCENTR,'
      '   PES.NOME,'
      '   EST.CODESTADO,'
      '   EST.NOMEESTADO,'
      '   UCT.IDPAIS'
      'FROM'
      '    EPUNDCENTRUF UCT,'
      '    PESSOA PES,'
      '    ESTADO EST'
      'WHERE'
      
        '    ((:PIDUNIDCENTR IS NULL) OR (UCT.IDUNIDCENTR = :PIDUNIDCENTR' +
        '))'
      'AND PES.IDPESSOA = UCT.IDUNIDCENTR'
      'AND UCT.CODESTADO = EST.CODESTADO(+)'
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'CODESTADO;CustomEdit;dblEstado')
    ValidateWithMask = True
    Left = 464
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDUNIDCENTR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUNIDCENTR'
        ParamType = ptInput
      end>
    object qryDetCODESTADO: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 7
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryDetNOMEESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 58
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object qryDetIDUNIDCENTR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUNIDCENTR'
      Visible = False
    end
    object qryDetNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object qryDetIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update EPUNDCENTRUF'
      'set'
      '  IDUNIDCENTR = :IDUNIDCENTR,'
      '  CODESTADO = :CODESTADO,'
      '  IDPAIS = :IDPAIS'
      'where'
      '  IDUNIDCENTR = :OLD_IDUNIDCENTR and'
      '  CODESTADO = :OLD_CODESTADO')
    InsertSQL.Strings = (
      'insert into EPUNDCENTRUF'
      '  (IDUNIDCENTR, CODESTADO, IDPAIS)'
      'values'
      '  (:IDUNIDCENTR, :CODESTADO, :IDPAIS)')
    DeleteSQL.Strings = (
      'delete from EPUNDCENTRUF'
      'where'
      '  IDUNIDCENTR = :OLD_IDUNIDCENTR and'
      '  CODESTADO = :OLD_CODESTADO')
    Left = 432
    Top = 208
  end
  object qryEstado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   EST.CODESTADO,'
      '   EST.NOMEESTADO,'
      '   EST.IDPAIS'
      'FROM'
      '    ESTADO EST'
      'WHERE '
      '   IDPAIS = :PIDPAIS'
      'ORDER BY'
      '   EST.CODESTADO')
    ValidateWithMask = True
    Left = 256
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPAIS'
        ParamType = ptInput
      end>
    object qryEstadoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.ESTADO.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryEstadoNOMEESTADO: TStringField
      FieldName = 'NOMEESTADO'
      Origin = 'BASEDADOS.ESTADO.NOMEESTADO'
      Size = 30
    end
    object qryEstadoIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'BASEDADOS.ESTADO.IDPAIS'
    end
  end
  object dsEstado: TwwDataSource
    DataSet = qryEstado
    Left = 200
    Top = 272
  end
end
