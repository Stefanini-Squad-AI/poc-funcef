inherited frmCadCCBaixaXPatro: TfrmCadCCBaixaXPatro
  Left = 20
  Top = 196
  HelpContext = 150047
  Caption = 'Parâmetros para Integração do Recebimento da(s) Patrocinadora(s)'
  ClientHeight = 275
  ClientWidth = 740
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 740
    Height = 242
    inherited Panel1: TPanel
      Width = 740
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object DBcboPatro: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 345
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        LookupTable = dtmLookEmptmo.qryLookPatro
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DBcboPatroCloseUp
      end
    end
    inherited pgc: TPageControl
      Width = 740
      Height = 182
      inherited tbs: TTabSheet
        inherited Dock973: TDock97
          Width = 732
        end
        inherited pnlControles: TPanel
          Width = 732
          Height = 138
          object Label2: TLabel
            Left = 608
            Top = 10
            Width = 96
            Height = 13
            Caption = 'Tipo de Contrato'
            Enabled = False
            Visible = False
          end
          object lblCCDebFinan: TLabel
            Left = 16
            Top = 10
            Width = 137
            Height = 13
            Caption = 'Conta Contábil de Baixa'
          end
          object Label3: TLabel
            Left = 16
            Top = 50
            Width = 122
            Height = 13
            Caption = 'Tipo de Recebimento'
          end
          object Label4: TLabel
            Left = 368
            Top = 50
            Width = 160
            Height = 13
            Caption = 'Centro de Responsabilidade'
          end
          object Label5: TLabel
            Left = 256
            Top = 10
            Width = 108
            Height = 13
            Caption = 'Atividade / Projeto'
          end
          object Label6: TLabel
            Left = 16
            Top = 90
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object Label7: TLabel
            Left = 368
            Top = 90
            Width = 231
            Height = 13
            Caption = 'Conta de Caixa x Forma de Recebimento'
          end
          object DBcboTipoContrato: TwwDBLookupCombo
            Left = 608
            Top = 24
            Width = 337
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
            DataField = 'IDTIPOCONTREMPTMO'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookTipoContrato
            LookupField = 'IDTIPOCONTREMPTMO'
            DropDownWidth = 8
            Enabled = False
            ParentFont = False
            TabOrder = 8
            Visible = False
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = DBcboTipoContratoCloseUp
            OnExit = DBcboTipoContratoExit
          end
          object btnLimpaContaCBaixa: TBitBtn
            Left = 216
            Top = 24
            Width = 24
            Height = 22
            Hint = 'Limpa a seleção de Regra'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnLimpaContaCBaixaClick
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
          object btnBuscaContaCBaixa: TBitBtn
            Left = 192
            Top = 24
            Width = 24
            Height = 22
            Hint = 'Busca uma Conta Contábil'
            TabOrder = 1
            OnClick = btnBuscaContaCBaixaClick
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
          object DBedtCCBaixa: TDBEdit
            Left = 16
            Top = 24
            Width = 177
            Height = 21
            DataField = 'CCBAIXA'
            DataSource = ds
            TabOrder = 0
            OnExit = DBedtCCBaixaExit
          end
          object DBcboTipoReceb: TwwDBLookupCombo
            Left = 16
            Top = 64
            Width = 337
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
            DataField = 'CODTIPRECDES'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookTipoReceb
            LookupField = 'CODTIPRECDES'
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 4
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = DBcboTipoRecebCloseUp
          end
          object DBcboUnidNegoc: TwwDBLookupCombo
            Left = 256
            Top = 24
            Width = 337
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'NOME'#9'F')
            DataField = 'UNIDNEGOC'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookUnidNegocio
            LookupField = 'UNIDNEGOC'
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 3
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBcboCentroRespon: TwwDBLookupCombo
            Left = 368
            Top = 64
            Width = 345
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'48'#9'NOME'#9'F')
            DataField = 'CODCENTRORESPON'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookCentroRespon
            LookupField = 'CODCENTRORESPON'
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 5
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBcboTipoDoc: TwwDBLookupCombo
            Left = 16
            Top = 104
            Width = 337
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO'#9'F')
            DataField = 'CODTIPDOC'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookTipoDocRec
            LookupField = 'CODTIPDOC'
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 6
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
          end
          object DBcboPortForma: TwwDBLookupCombo
            Left = 368
            Top = 104
            Width = 345
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
            DataField = 'CODPORTFORMA'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookPortadorFormaR
            LookupField = 'CODPORTFORMA'
            DropDownWidth = 8
            ParentFont = False
            TabOrder = 7
            AutoDropDown = False
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        inherited pnlGrd: TPanel
          Top = 169
          Width = 732
          Height = 3
          inherited DBgrd: TwwDBGrid
            Left = 15
            Top = 34
            Width = 699
            Height = 143
            Selected.Strings = (
              'TCEDESCRICAO'#9'63'#9'Tipo de Contrato'
              'CCBAIXA'#9'31'#9'Conta Contábil de Baixa')
            TabOrder = 1
          end
          object Panel3: TPanel
            Left = 15
            Top = 8
            Width = 699
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Parâmetros por Patrocinadora'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 242
    Width = 740
    inherited tb97Fundo: TToolbar97
      Left = 568
      DockPos = 610
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 396
      DockPos = 438
    end
  end
  inherited ds: TwwDataSource
    DataSet = qry
    Left = 464
    Top = 16
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 528
    Top = 16
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOCONTRXPPATRO'
      'set'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  IDPATRO = :IDPATRO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  CCBAIXA = :CCBAIXA,'
      '  PLANO = :PLANO,'
      '  IDPESSOA = :IDPESSOA,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  CODTIPDOC = :CODTIPDOC'
      'where'
      '  IDTIPOCONTRXPATRO = :OLD_IDTIPOCONTRXPATRO')
    InsertSQL.Strings = (
      'insert into TIPOCONTRXPPATRO'
      '  (IDTIPOCONTRXPATRO, IDTIPOCONTREMPTMO, IDPATRO, IDPLANOPREV, '
      'CCBAIXA, '
      '   PLANO, IDPESSOA, RECPAG, CODTIPRECDES, UNIDNEGOC, '
      'CODCENTRORESPON, CODPORTFORMA, '
      '   CODTIPDOC)'
      'values'
      
        '  (:IDTIPOCONTRXPATRO, :IDTIPOCONTREMPTMO, :IDPATRO, :IDPLANOPRE' +
        'V, '
      ':CCBAIXA, '
      '   :PLANO, :IDPESSOA, :RECPAG, :CODTIPRECDES, :UNIDNEGOC, '
      ':CODCENTRORESPON, '
      '   :CODPORTFORMA, :CODTIPDOC)')
    DeleteSQL.Strings = (
      'delete from TIPOCONTRXPPATRO'
      'where'
      '  IDTIPOCONTRXPATRO = :OLD_IDTIPOCONTRXPATRO')
    Left = 400
    Top = 16
  end
  inherited qry: TwwQuery
    BeforeEdit = qryBeforeEdit
    AfterPost = qryAfterPost
    SQL.Strings = (
      'SELECT'
      '   TP.IDTIPOCONTRXPATRO,'
      '   TP.IDTIPOCONTREMPTMO,'
      '   TP.IDPATRO,'
      '   TP.IDPLANOPREV,'
      '   TP.CCBAIXA,'
      '   TP.PLANO,'
      ''
      '   TP.IDPESSOA,'
      '   TP.RECPAG,'
      '   TP.CODTIPRECDES,'
      '   TP.UNIDNEGOC,'
      '   TP.CODCENTRORESPON,'
      ''
      '   TP.CODPORTFORMA,'
      '   TP.CODTIPDOC,'
      ''
      '   TC.TCEDESCRICAO'
      ''
      'FROM'
      '   TIPOCONTRXPPATRO TP, TIPOCONTREMPTMO TC'
      ''
      'WHERE'
      '       ( TP.IDPATRO =:PIDPATRO )'
      '   AND ( TP.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO(+) )'
      ''
      'ORDER BY'
      '   TC.TCEDESCRICAO')
    UpdateObject = upd
    Left = 432
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end>
    object qryTCEDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Contrato'
      DisplayWidth = 63
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object qryCCBAIXA: TStringField
      DisplayLabel = 'Conta Contábil de Baixa'
      DisplayWidth = 31
      FieldName = 'CCBAIXA'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.CCBAIXA'
      FixedChar = True
      Size = 18
    end
    object qryIDTIPOCONTRXPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTRXPATRO'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.IDTIPOCONTRXPATRO'
      Visible = False
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.IDTIPOCONTREMPTMO'
      Visible = False
    end
    object qryIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.IDPATRO'
      Visible = False
    end
    object qryIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.IDPLANOPREV'
      Visible = False
    end
    object qryPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.TIPOCONTRXPPATRO.PLANO'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TP.IDTIPOCONTRXPATRO'
      ''
      'FROM'
      '   TIPOCONTRXPPATRO TP'
      ''
      'WHERE'
      '   ('
      '   ( TP.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      
        '   OR ( (:PIDTIPOCONTREMPTMO IS NULL) AND (TP.IDTIPOCONTREMPTMO ' +
        'IS NULL) )'
      '   )'
      '   AND ( TP.IDTIPOCONTRXPATRO <>:PIDTIPOCONTRXPATRO )'
      '   AND ( TP.IDPATRO =:PIDPATRO )')
    ValidateWithMask = True
    Left = 632
    Top = 16
    ParamData = <
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
        Name = 'PIDTIPOCONTRXPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end>
  end
end
