inherited frmCadMascara: TfrmCadMascara
  Left = 245
  Top = 97
  Caption = 'Cadastro de Máscaras'
  ClientHeight = 200
  ClientWidth = 335
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 335
    Height = 114
    object grpMascara: TGroupBox
      Left = 76
      Top = 26
      Width = 186
      Height = 62
      Caption = ' Máscara '
      TabOrder = 0
      object DBEdMascara: TwwDBEdit
        Left = 12
        Top = 24
        Width = 161
        Height = 21
        DataField = 'MASCSETOREMISSOR'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnKeyPress = DBEdMascaraKeyPress
      end
    end
  end
  inherited Dock971: TDock97
    Top = 161
    Width = 335
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited Dock972: TDock97
    Width = 335
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'Select      P.IdParamInvest ,'
      '                P.MascSetorEmissor'
      ''
      'from         CM.PARAMINVEST P')
    Left = 39
    Top = 120
  end
  inherited ds: TwwDataSource
    Left = 69
    Top = 120
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update cm.ParamInvest'
      'set'
      '  IDPARAMINVEST = :IDPARAMINVEST,'
      '  MASCSETOREMISSOR = :MASCSETOREMISSOR'
      'where'
      '  IDPARAMINVEST = :OLD_IDPARAMINVEST')
    InsertSQL.Strings = (
      'insert into cm.ParamInvest'
      '  (IDPARAMINVEST, MASCSETOREMISSOR)'
      'values'
      '  (:IDPARAMINVEST, :MASCSETOREMISSOR)')
    DeleteSQL.Strings = (
      'delete from cm.ParamInvest'
      'where'
      '  IDPARAMINVEST = :OLD_IDPARAMINVEST')
    Left = 9
    Top = 120
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PARAMINVEST.MASCSETOREMISSOR')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Mascara')
    Tabelas.Strings = (
      'PARAMINVEST')
    CamposChave.Strings = (
      'PARAMINVEST.IDPARAMINVEST')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '15')
    Left = 101
    Top = 120
  end
  object qryaux: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'Select P.IdParamInvest ,P.MascSetorEmissor from CM.PARAMINVEST P')
    ValidateWithMask = True
    Left = 480
    Top = 151
  end
end
	
