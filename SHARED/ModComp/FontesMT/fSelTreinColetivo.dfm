inherited frmSelTreinColetivo: TfrmSelTreinColetivo
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Selecionar Pessoas a Inscrever'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      inherited pgctrlPrincipal: TPageControl
        inherited tsDadosFunc: TTabSheet
          inherited rgSequencia: TGroupBox
            Visible = False
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnOutraVez: TBitBtn
        ModalResult = 0
        Kind = bkCustom
      end
    end
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'TIPO;NOME'
        Options = [ixCaseInsensitive]
      end>
  end
end
