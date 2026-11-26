inherited FrmEscolheMotivo: TFrmEscolheMotivo
  Left = 245
  Top = 216
  Caption = 'Motivo'
  ClientHeight = 142
  ClientWidth = 321
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 321
    Height = 103
    object Label8: TLabel
      Left = 24
      Top = 22
      Width = 261
      Height = 26
      Caption = 
        'Para gerar contribuições para o beneficiário é necessário indica' +
        'r um novo Motivo.'
      WordWrap = True
    end
    object DbLkcNovoMotivo: TwwDBLookupCombo
      Left = 24
      Top = 52
      Width = 273
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Motivo')
      LookupTable = QryMotivo
      LookupField = 'IDMOTIVO'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 103
    Width = 321
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 179
    Top = 55
  end
  object QryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, DESCRICAO'
      'FROM'
      '  MOTIVO'
      'WHERE'
      '  IDMOTIVO <> :IDMOTIVO'
      'ORDER BY'
      '  DESCRICAO')
    Params.Data = {010001000849444D4F5449564F00030400000000000000}
    ValidateWithMask = True
    Left = 147
    Top = 55
  end
end
pTableqryRgSalMediaAtuLookupFieldIDREGRAOptionsloTitles
