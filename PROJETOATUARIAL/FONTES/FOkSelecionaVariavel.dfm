inherited frmOkSelecionaVariavel: TfrmOkSelecionaVariavel
  Left = 208
  Top = 127
  Caption = 'Selecionar Variável'
  ClientHeight = 241
  ClientWidth = 407
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 407
    Height = 202
    object LstBxVariavel: TListBox
      Left = 1
      Top = 1
      Width = 405
      Height = 200
      Align = alClient
      Columns = 2
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = LstBxVariavelDblClick
    end
  end
  inherited Dock971: TDock97
    Top = 202
    Width = 407
    inherited tb97Fundo: TToolbar97
      Left = 235
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 66
    end
  end
  object qryVariaveisTabua: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NO_VARIAVEL_RESULT'
      'from FI_SEQUENCIA_FORMULA a, FI_FORMULA b'
      'where a.CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA  and '
      '          a.CD_FORMULA = b.CD_FORMULA'
      'order by NR_ORDEM_FORMULA')
    ValidateWithMask = True
    Left = 55
    Top = 19
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_FORMULA'
        ParamType = ptInput
      end>
    object qryVariaveisTabuaNO_VARIAVEL_RESULT: TStringField
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'BASEDADOS.FI_FORMULA.NO_VARIAVEL_RESULT'
      FixedChar = True
    end
  end
end
