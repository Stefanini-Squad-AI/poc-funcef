inherited frmCadPlanTipCont: TfrmCadPlanTipCont
  Top = 72
  Caption = 'Cadastro de Tipos de Contrato por Plano'
  ClientHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 334
    inherited pnlMestre: TPanel
      Height = 99
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label2: TLabel
        Left = 456
        Top = 53
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object Label3: TLabel
        Left = 16
        Top = 53
        Width = 96
        Height = 13
        Caption = 'Tipo de Contrato'
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 377
        Height = 21
        DataField = 'NOMEPLANO'
        DataSource = ds
        TabOrder = 0
      end
      object btnBuscaContrato: TBitBtn
        Left = 393
        Top = 24
        Width = 24
        Height = 21
        Hint = 'Busca um Contrato'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
        TabOrder = 2
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
      object DBEdit2: TDBEdit
        Left = 456
        Top = 69
        Width = 65
        Height = 21
        DataField = 'PERCENTUAL'
        DataSource = ds
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 69
        Width = 377
        Height = 21
        DataField = 'TCEDESCRICAO'
        DataSource = ds
        TabOrder = 4
      end
      object BitBtn1: TBitBtn
        Left = 393
        Top = 69
        Width = 24
        Height = 21
        Hint = 'Busca um Contrato'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = BitBtn1Click
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
      object BitBtn2: TBitBtn
        Left = 417
        Top = 69
        Width = 24
        Height = 21
        Hint = 'Limpa a seleção de Contrato'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 100
      Height = 233
      inherited pgctrlDetalhe: TPageControl
        Height = 176
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Height = 148
            Selected.Strings = (
              'NOME'#9'55'#9'Unidade'
              'PERCENTUAL'#9'10'#9'Percentual')
          end
          inherited pnlControlesDet: TPanel [1]
            Height = 148
            object wwDBGrid1: TwwDBGrid
              Left = 0
              Top = 0
              Width = 502
              Height = 148
              Selected.Strings = (
                'NOME'#9'55'#9'Unidade'
                'PERCENTUAL'#9'10'#9'Percentual')
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
      inherited Dock974: TDock97
        Height = 176
        object dblUnidCentr: TwwDBLookupCombo
          Left = 0
          Top = 120
          Width = 121
          Height = 21
          DropDownAlignment = taLeftJustify
          LookupTable = qryUnidCentr
          LookupField = 'NOME'
          TabOrder = 1
          Visible = False
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnCloseUp = dblUnidCentrCloseUp
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
  inherited Dock971: TDock97
    Top = 369
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     PTC.IDPLANOPREV,'
      '     PTC.IDTIPOCONTREMPTMO,'
      '     PTC.PERCENTUAL,'
      '     PLP.NOME AS NOMEPLANO,'
      '     TCE.TCEDESCRICAO'
      'FROM'
      '     EPPLANTIPCONT PTC,'
      '     PLANPREV PLP,'
      '     TIPOCONTREMPTMO TCE'
      'WHERE'
      
        '     ((:PIDPLANOPREV IS NULL) OR (PTC.IDPLANOPREV = :PIDPLANOPRE' +
        'V))'
      
        'AND  ((:PIDTIPOCONTREMPTMO IS NULL) OR (PTC.IDTIPOCONTREMPTMO = ' +
        ':PIDTIPOCONTREMPTMO))'
      'AND  PTC.IDPLANOPREV       = PLP.IDPLANOPREV(+)'
      'AND  PTC.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO(+)'
      ''
      '     ')
    Left = 144
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 392
    Top = 256
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update EPPLANTIPCONT'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  PERCENTUAL = :PERCENTUAL'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO')
    InsertSQL.Strings = (
      'insert into EPPLANTIPCONT'
      '  (IDPLANOPREV, IDTIPOCONTREMPTMO, PERCENTUAL)'
      'values'
      '  (:IDPLANOPREV, :IDTIPOCONTREMPTMO, :PERCENTUAL)')
    DeleteSQL.Strings = (
      'delete from EPPLANTIPCONT'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO')
    Left = 184
    Top = 272
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLP.IDPLANOPREV'
      'PLP.NOME'
      'TCE.IDTIPOCONTREMPTMO'
      'TCE.TCEDESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'ID Plano'
      'Nome Plano'
      'Tipo de Contrato'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EPPLANTIPCONT PTC'
      'PLANPREV PLP'
      'TIPOCONTREMPTMO TCE')
    CamposChave.Strings = (
      'PLP.IDPLANOPREV'
      'TCE.IDTIPOCONTREMPTMO')
    Filtro.Strings = (
      'PLP.IDPLANOPREV = PTC.IDPLANOPREV'
      'TCE.IDTIPOCONTREMPTMO = PTC.IDTIPOCONTREMPTMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '50'
      '10'
      '60')
    Left = 136
    Top = 224
  end
  inherited ds: TwwDataSource
    Left = 128
    Top = 312
  end
  inherited ImlPadrao: TImageList
    Left = 41
    Top = 114
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 134
    Top = 330
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    Left = 392
    Top = 308
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update EPUNDPLANTIPCONT'
      'set'
      '  IDUNIDCENTR = :IDUNIDCENTR,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  PERCENTUAL = :PERCENTUAL'
      'where'
      '  IDUNIDCENTR = :OLD_IDUNIDCENTR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO')
    InsertSQL.Strings = (
      'insert into EPUNDPLANTIPCONT'
      '  (IDUNIDCENTR, IDPLANOPREV, IDTIPOCONTREMPTMO, PERCENTUAL)'
      'values'
      '  (:IDUNIDCENTR, :IDPLANOPREV, :IDTIPOCONTREMPTMO, :PERCENTUAL)')
    DeleteSQL.Strings = (
      'delete from EPUNDPLANTIPCONT'
      'where'
      '  IDUNIDCENTR = :OLD_IDUNIDCENTR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO')
    Left = 280
    Top = 280
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    UPTC.IDUNIDCENTR,'
      '    UPTC.IDPLANOPREV,'
      '    UPTC.IDTIPOCONTREMPTMO,'
      '    UPTC.PERCENTUAL,'
      '    PES.NOME'
      ''
      'FROM'
      '    EPUNDPLANTIPCONT UPTC,'
      '    PESSOA PES'
      'WHERE'
      
        '     ((:PIDPLANOPREV IS NULL) OR (UPTC.IDPLANOPREV = :PIDPLANOPR' +
        'EV))'
      
        'AND  ((:PIDTIPOCONTREMPTMO IS NULL) OR (UPTC.IDTIPOCONTREMPTMO =' +
        ' :PIDTIPOCONTREMPTMO))'
      
        'AND  ((:PIDUNIDCENTR IS NULL) OR (UPTC.IDUNIDCENTR = :PIDUNIDCEN' +
        'TR))'
      'AND  UPTC.IDUNIDCENTR = PES.IDPESSOA(+)'
      ''
      ''
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'NOME;CustomEdit;dblUnidCentr')
    ValidateWithMask = True
    Left = 336
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
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
    object qryDetNOME: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 55
      FieldName = 'NOME'
      Size = 60
    end
    object qryDetPERCENTUAL: TFloatField
      DisplayLabel = 'Percentual'
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object qryDetIDUNIDCENTR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUNIDCENTR'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetIDTIPOCONTREMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTREMPTMO'
      Visible = False
    end
  end
  object MS_Plano: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IDPLANOPREV'
      'NOME')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'ID Plano'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANPREV')
    CamposChave.Strings = (
      'IDPLANOPREV'
      'NOME')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 528
    Top = 48
  end
  object MS_TipoContrEmptmo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'IDTIPOCONTREMPTMO'
      'TCEDESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      ''
      '')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOCONTREMPTMO')
    CamposChave.Strings = (
      'IDTIPOCONTREMPTMO'
      'TCEDESCRICAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 536
    Top = 96
  end
  object dsUnidCentr: TwwDataSource
    DataSet = qryUnidCentr
    Left = 288
    Top = 208
  end
  object qryUnidCentr: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDUNIDCENTR,'
      '   PERCENTUAL,'
      '   NOME'
      'FROM'
      '   EPUNDCENTR,'
      '   PESSOA'
      'WHERE'
      '   IDPESSOA = IDUNIDCENTR '
      ''
      ' ')
    ValidateWithMask = True
    Left = 344
    Top = 208
    object qryUnidCentrIDUNIDCENTR: TFloatField
      FieldName = 'IDUNIDCENTR'
      Origin = 'BASEDADOS.EPUNDCENTR.IDUNIDCENTR'
    end
    object qryUnidCentrNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryUnidCentrPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Origin = 'BASEDADOS.EPUNDCENTR.PERCENTUAL'
    end
  end
end
