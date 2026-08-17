inherited frmExcluiPgto: TfrmExcluiPgto
  Left = 246
  Top = 178
  Caption = 'Exclui todos os pagamentos'
  ClientHeight = 150
  ClientWidth = 336
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 336
    Height = 111
    object RichEdit1: TRichEdit
      Left = 5
      Top = 5
      Width = 326
      Height = 101
      Align = alClient
      Lines.Strings = (
        'A T E N Ç Ã O:'
        ''
        'Este procedimento excluirá todos os pagamentos '
        'efetuados no contas a pagar, o financeiro e sua '
        'contabilização')
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 111
    Width = 336
    inherited tb97Fundo: TToolbar97
      Left = 167
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 294
    Top = 69
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 231
    Top = 69
  end
end
