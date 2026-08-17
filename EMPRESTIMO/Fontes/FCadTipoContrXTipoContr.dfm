inherited frmCadTipoContrXTipoContr: TfrmCadTipoContrXTipoContr
  Left = 342
  Top = 175
  HelpContext = 150061
  Caption = 'Tipos de Contratos Quitáveis por Tipo de Contrato'
  ClientHeight = 327
  ClientWidth = 437
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 437
    Height = 294
    inherited Panel1: TPanel
      Width = 437
      Height = 56
      object Label2: TLabel
        Left = 16
        Top = 10
        Width = 96
        Height = 13
        Caption = 'Tipo de Contrato'
      end
      object DBcboTipoContr: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TCEDESCRICAO'#9'60'#9'Tipo de Contrato'#9'F')
        LookupTable = dtmLookEmptmo.qryLookTipoContrato
        LookupField = 'IDTIPOCONTREMPTMO'
        DropDownCount = 15
        DropDownWidth = 8
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DBcboTipoContrCloseUp
      end
    end
    inherited pgc: TPageControl
      Top = 56
      Width = 437
      Height = 238
      inherited tbs: TTabSheet
        inherited Dock973: TDock97
          Width = 429
          inherited tb97BotoesDetalhe: TToolbar97
            inherited sbtnAlterar: TSpeedButton
              Width = 24
              Visible = False
            end
            inherited sbtnApagar: TSpeedButton
              Left = 97
            end
          end
        end
        inherited pnlControles: TPanel
          Width = 429
          object Label1: TLabel
            Left = 16
            Top = 10
            Width = 147
            Height = 13
            Caption = 'Tipo de Contrato Quitável'
          end
          object Bevel1: TBevel
            Left = 16
            Top = 56
            Width = 393
            Height = 2
            Shape = bsTopLine
          end
          object DBcboTipoContrQuit: TwwDBLookupCombo
            Left = 16
            Top = 24
            Width = 393
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TCEDESCRICAO'#9'60'#9'Tipo de Contrato'#9'F')
            DataField = 'IDTIPOCONTRQUIT'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookTipoContr
            LookupField = 'IDTIPOCONTREMPTMO'
            DropDownCount = 15
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
            ShowMatchText = True
            OnCloseUp = DBcboTipoContrQuitCloseUp
          end
          object dbckObrigatorio: TDBCheckBox
            Left = 16
            Top = 52
            Width = 217
            Height = 17
            Caption = 'Quitação Obrigatória'
            DataField = 'FLGOBRIGATORIO'
            DataSource = ds
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        inherited pnlGrd: TPanel
          Width = 429
          Height = 130
          object Label3: TLabel [0]
            Left = 16
            Top = 2
            Width = 159
            Height = 13
            Caption = 'Tipos de Contrato Quitáveis'
          end
          inherited DBgrd: TwwDBGrid
            Width = 441
            Selected.Strings = (
              'TIPOCONTRQUIT'#9'47'#9'Tipo de Contrato Quitável'
              'FLGOBRIGATORIO'#9'10'#9'Obrigatório')
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 294
    Width = 437
    inherited tb97Fundo: TToolbar97
      Left = 265
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 93
    end
  end
  inherited ds: TwwDataSource
    DataSet = qry
    Left = 288
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 344
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOCONTRXQUIT'
      'set'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  IDTIPOCONTRQUIT = :IDTIPOCONTRQUIT,'
      '  FLGOBRIGATORIO = :FLGOBRIGATORIO'
      'where'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO and'
      '  IDTIPOCONTRQUIT = :OLD_IDTIPOCONTRQUIT')
    InsertSQL.Strings = (
      'insert into TIPOCONTRXQUIT'
      '  (IDTIPOCONTREMPTMO, IDTIPOCONTRQUIT, FLGOBRIGATORIO)'
      'values'
      '  (:IDTIPOCONTREMPTMO, :IDTIPOCONTRQUIT, :FLGOBRIGATORIO)')
    DeleteSQL.Strings = (
      'delete from TIPOCONTRXQUIT'
      'where'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO and'
      '  IDTIPOCONTRQUIT = :OLD_IDTIPOCONTRQUIT')
    Left = 224
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   TXQ.IDTIPOCONTREMPTMO,'
      '   TXQ.IDTIPOCONTRQUIT,'
      '   TXQ.FLGOBRIGATORIO,'
      '   TCE.TCEDESCRICAO AS TIPOCONTREMPTMO,'
      '   TCQ.TCEDESCRICAO AS TIPOCONTRQUIT'
      'FROM'
      '   TIPOCONTRXQUIT  TXQ,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOCONTREMPTMO TCQ'
      'WHERE'
      '       TXQ.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO'
      '   AND TXQ.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      '   AND TXQ.IDTIPOCONTRQUIT   = TCQ.IDTIPOCONTREMPTMO'
      ' ')
    UpdateObject = upd
    ControlType.Strings = (
      'FLGOBRIGATORIO;CheckBox;1;0')
    Left = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryTIPOCONTRQUIT: TStringField
      DisplayLabel = 'Tipo de Contrato Quitável'
      DisplayWidth = 60
      FieldName = 'TIPOCONTRQUIT'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object qryFLGOBRIGATORIO: TFloatField
      DisplayLabel = 'Obrigatório'
      DisplayWidth = 10
      FieldName = 'FLGOBRIGATORIO'
      Origin = 'BASEDADOS.TIPOCONTRXQUIT.FLGOBRIGATORIO'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTRXQUIT.IDTIPOCONTREMPTMO'
      Visible = False
    end
    object qryIDTIPOCONTRQUIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCONTRQUIT'
      Origin = 'BASEDADOS.TIPOCONTRXQUIT.IDTIPOCONTRQUIT'
      Visible = False
    end
    object qryTIPOCONTREMPTMO: TStringField
      DisplayWidth = 60
      FieldName = 'TIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Visible = False
      Size = 60
    end
  end
end
