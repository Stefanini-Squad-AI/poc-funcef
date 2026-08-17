inherited frmListaValores: TfrmListaValores
  Left = 242
  Top = 118
  BorderStyle = bsDialog
  Caption = 'Lista Valores de Campos'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object dblkpVariaveis: TDBLookupListBox
      Left = 5
      Top = 5
      Width = 518
      Height = 214
      Align = alClient
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      KeyField = 'CAMPO'
      ListField = 'CAMPO'
      ListSource = dsLista
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnDblClick = bbtnConfirmarClick
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object Qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      #9'ENTIDADE, NOMEDOCAMPO '
      'FROM '
      #9'CMPBD '
      'WHERE'
      
        #9'(CAMPODOBANCO = 1) AND (UPPER(ENTIDADE) <> '#39'DUAL'#39') AND (IDCAMPO' +
        ' = :ID)'
      'ORDER BY'
      #9'ENTIDADE, NOMEDOCAMPO')
    ValidateWithMask = True
    Left = 80
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object QryLista: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT DESCINVESTIMENTO AS CAMPO FROM INVESTIMENTO ORDE' +
        'R BY CAMPO')
    ValidateWithMask = True
    Left = 240
    Top = 40
  end
  object dsLista: TwwDataSource
    DataSet = QryLista
    Left = 304
    Top = 40
  end
end
