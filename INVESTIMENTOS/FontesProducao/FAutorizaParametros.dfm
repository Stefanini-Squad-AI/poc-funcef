inherited frmAutorizaParametros: TfrmAutorizaParametros
  Left = 507
  Top = 274
  Caption = 'Autorização'
  ClientHeight = 164
  ClientWidth = 251
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 251
    Height = 125
    inherited bvlSepTit: TBevel
      Width = 249
    end
    object Label1: TLabel [1]
      Left = 24
      Top = 64
      Width = 37
      Height = 13
      Caption = 'Senha'
    end
    inherited pnlTitulo: TPanel
      Width = 249
      inherited lbNomDescricao: TfcLabel
        Width = 173
        Caption = 'Nome do Usuário'
      end
    end
    object edtSenha: TEdit
      Left = 24
      Top = 80
      Width = 177
      Height = 21
      PasswordChar = '#'
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 125
    Width = 251
    inherited tb97Fundo: TToolbar97
      Left = 169
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Caption = '&Corrige'
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 195
    Top = 11
  end
  object qry: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FATORCALC FROM PARAMINVEST')
    Left = 208
    Top = 72
  end
end
