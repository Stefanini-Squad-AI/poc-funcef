inherited frmParamCartaComunicadoAux: TfrmParamCartaComunicadoAux
  Left = 318
  Top = 105
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Seleção para Envio de Carta ou Comunicado'
  ClientHeight = 363
  ClientWidth = 609
  Font.Style = []
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 609
    Height = 324
    inherited pnSelecao: TPanel
      Width = 605
      Height = 320
      inherited pnResult: TPanel
        Width = 603
        Height = 318
      end
      inherited pgctrlPrincipal: TPageControl
        Width = 603
        Height = 318
        ActivePage = tsDadosFunc
        inherited tsDadosFunc: TTabSheet
          inherited gbxSalario: TGroupBox
            inherited Label4: TLabel
              Width = 6
            end
          end
          inherited gbxTempAdm: TGroupBox
            inherited Label1: TLabel
              Width = 6
            end
          end
          inherited gbxTempLot: TGroupBox
            inherited Label2: TLabel
              Width = 6
            end
          end
          inherited gbxTempCar: TGroupBox
            inherited Label3: TLabel
              Width = 6
            end
          end
          inherited gbxAdmissao: TGroupBox
            inherited Label7: TLabel
              Width = 14
            end
            inherited Label8: TLabel
              Width = 7
            end
          end
        end
        inherited tsDadosPess: TTabSheet
          inherited gbxIdade: TGroupBox
            inherited Label5: TLabel
              Width = 6
            end
          end
          inherited gbxCep: TGroupBox
            inherited Label6: TLabel
              Width = 6
            end
          end
          inherited GroupBox1: TGroupBox
            inherited Label42: TLabel
              Width = 41
            end
          end
        end
        inherited tbsDemit: TTabSheet
          inherited gbxDemitidos: TGroupBox
            Width = 595
            Height = 290
            inherited LabelDeData: TLabel
              Width = 14
            end
            inherited LabelAdata: TLabel
              Width = 7
            end
            inherited Label711: TLabel
              Width = 90
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 324
    Width = 609
    inherited tb97Fundo: TToolbar97
      Left = 345
      DockPos = 448
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 176
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 563
    Top = 275
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'TIPO;NOME'
        Options = [ixCaseInsensitive]
      end>
    Top = 303
  end
  inherited sqlCCusto: TCMSqlParams
    Top = 281
  end
end
