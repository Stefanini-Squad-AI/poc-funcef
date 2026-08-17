inherited cfgRelProtocolo: TcfgRelProtocolo
  Left = 58
  Top = 245
  Caption = 'Protocolo de Solicitação de Empréstimos'
  ClientHeight = 92
  ClientWidth = 624
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 624
    Height = 59
    inline molContratoEmptmo: TmolContratoEmptmo
      Left = 8
      Top = 8
      Width = 609
      inherited Label1: TLabel
        Left = 112
      end
      inherited edtNome: TEdit
        Left = 112
        Width = 441
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 552
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 576
      end
      inherited edtIdContrato: TEdit
        Width = 105
      end
    end
  end
  inherited Dock971: TDock97
    Top = 59
    Width = 624
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
end
