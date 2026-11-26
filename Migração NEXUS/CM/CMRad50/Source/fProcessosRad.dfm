inherited frmProcessosRad: TfrmProcessosRad
  Left = 164
  Top = 195
  HelpContext = 230048
  Caption = 'Processos RAD'
  ClientHeight = 426
  ClientWidth = 779
  Constraints.MinHeight = 460
  Constraints.MinWidth = 787
  Position = poDesigned
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 779
    Height = 387
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 777
      Height = 385
      ActivePage = tabProc
      Align = alClient
      TabOrder = 0
      OnChange = PageControlChange
      OnChanging = PageControlChanging
      object tabProc: TTabSheet
        Caption = 'Processos'
        object pnlProcessos: TPanel
          Left = 0
          Top = 0
          Width = 769
          Height = 357
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 769
            Height = 357
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter2: TSplitter
              Left = 246
              Top = 0
              Width = 4
              Height = 357
              Cursor = crHSplit
              Beveled = True
              Color = clBtnFace
              ParentColor = False
              ResizeStyle = rsUpdate
            end
            object Panel1: TPanel
              Left = 250
              Top = 0
              Width = 519
              Height = 357
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Label1: TLabel
                Left = 5
                Top = 21
                Width = 53
                Height = 13
                Caption = 'Processo'
                FocusControl = DBEdit1
              end
              object Label3: TLabel
                Left = 136
                Top = 21
                Width = 34
                Height = 13
                Caption = 'Início'
                FocusControl = DBEdit3
              end
              object lblFimRAD: TLabel
                Left = 267
                Top = 21
                Width = 69
                Height = 13
                Caption = 'Fim previsto'
              end
              object Label19: TLabel
                Left = 396
                Top = 21
                Width = 61
                Height = 13
                Caption = 'Solicitante'
              end
              object Label5: TLabel
                Left = 5
                Top = 62
                Width = 100
                Height = 13
                Caption = 'Tipo de Processo'
                FocusControl = DBEdit5
              end
              object Label8: TLabel
                Left = 5
                Top = 104
                Width = 69
                Height = 13
                Caption = 'Observação'
              end
              object Label2: TLabel
                Left = 396
                Top = 61
                Width = 51
                Height = 13
                Caption = 'Situação'
              end
              object grbDetProc: TGroupBox
                Left = 5
                Top = 247
                Width = 510
                Height = 106
                Caption = 'Detalhes do Processo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
                object nbDetProc: TNotebook
                  Left = 2
                  Top = 15
                  Width = 506
                  Height = 89
                  Align = alClient
                  PageIndex = 5
                  TabOrder = 0
                  object TPage
                    Left = 0
                    Top = 0
                    Caption = 'nbpgDoc'
                    object Label10: TLabel
                      Left = 10
                      Top = 4
                      Width = 160
                      Height = 13
                      Caption = 'Centro de Responsabilidade'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label20: TLabel
                      Left = 263
                      Top = 4
                      Width = 112
                      Height = 13
                      Caption = 'Tipo de Documento'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label21: TLabel
                      Left = 263
                      Top = 46
                      Width = 30
                      Height = 13
                      Caption = 'Valor'
                      FocusControl = DBEdit10
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit10: TDBEdit
                      Left = 10
                      Top = 18
                      Width = 215
                      Height = 21
                      Color = 15658734
                      DataField = 'CRESPON'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit13: TDBEdit
                      Left = 263
                      Top = 18
                      Width = 215
                      Height = 21
                      Color = 15658734
                      DataField = 'TIPODOC'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object DBEdit14: TDBEdit
                      Left = 263
                      Top = 60
                      Width = 130
                      Height = 21
                      Color = 15658734
                      DataField = 'VALOR'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 2
                    end
                  end
                  object TPage
                    Left = 0
                    Top = 0
                    Caption = 'nbpgSemRef'
                    object nbItensSemRef: TNotebook
                      Left = 0
                      Top = 0
                      Width = 485
                      Height = 89
                      Align = alClient
                      TabOrder = 1
                      object TPage
                        Left = 0
                        Top = 0
                        Caption = 'pgSemRef1'
                        object Label4: TLabel
                          Left = 10
                          Top = 4
                          Width = 160
                          Height = 13
                          Caption = 'Centro de Responsabilidade'
                          FocusControl = DBEdit4
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label7: TLabel
                          Left = 263
                          Top = 4
                          Width = 112
                          Height = 13
                          Caption = 'Tipo de Documento'
                          FocusControl = DBEdit4
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label23: TLabel
                          Left = 263
                          Top = 46
                          Width = 30
                          Height = 13
                          Caption = 'Valor'
                          FocusControl = DBEdit4
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label24: TLabel
                          Left = 10
                          Top = 46
                          Width = 92
                          Height = 13
                          Caption = 'Centro de Custo'
                          FocusControl = DBEdit17
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit4: TDBEdit
                          Left = 10
                          Top = 18
                          Width = 215
                          Height = 21
                          Color = 15658734
                          DataField = 'CRESPON'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 0
                        end
                        object DBEdit7: TDBEdit
                          Left = 263
                          Top = 18
                          Width = 215
                          Height = 21
                          Color = 15658734
                          DataField = 'TIPODOC'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 1
                        end
                        object DBEdit16: TDBEdit
                          Left = 263
                          Top = 60
                          Width = 130
                          Height = 21
                          Color = 15658734
                          DataField = 'VALOR'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 2
                        end
                        object DBEdit17: TDBEdit
                          Left = 10
                          Top = 60
                          Width = 215
                          Height = 21
                          Color = 15658734
                          DataField = 'CCUSTO'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 3
                        end
                      end
                      object TPage
                        Left = 0
                        Top = 0
                        Caption = 'pgSemRef2'
                        object Label25: TLabel
                          Left = 10
                          Top = 4
                          Width = 107
                          Height = 13
                          Caption = 'Grupo de Produtos'
                          FocusControl = DBEdit18
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label26: TLabel
                          Left = 263
                          Top = 4
                          Width = 98
                          Height = 13
                          Caption = 'Atividade Projeto'
                          FocusControl = DBEdit19
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit18: TDBEdit
                          Left = 10
                          Top = 18
                          Width = 215
                          Height = 21
                          Color = 15658734
                          DataField = 'DESCGRUPOPROD'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 0
                        end
                        object DBEdit19: TDBEdit
                          Left = 263
                          Top = 18
                          Width = 215
                          Height = 21
                          Color = 15658734
                          DataField = 'UNIDNEGOC'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 1
                        end
                      end
                    end
                    object pnlUpDown: TPanel
                      Left = 485
                      Top = 0
                      Width = 21
                      Height = 89
                      Align = alRight
                      BevelOuter = bvNone
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 0
                      object btnUpSemRef: TSpeedButton
                        Left = 0
                        Top = 19
                        Width = 18
                        Height = 18
                        Hint = 'Vai para a página anterior'
                        Flat = True
                        Glyph.Data = {
                          36040000424D3604000000000000360000002800000010000000100000000100
                          2000000000000004000000000000000000000000000000000000FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00008000000080000000800000008000000080000000800000008000000080
                          00000080000000800000008000000080000000800000FF00FF00FF00FF00FF00
                          FF00FF00FF000080000000800000008000000080000000800000008000000080
                          000000800000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF0000800000008000000080000000800000008000000080
                          0000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00008000000080000000800000008000000080
                          00000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF000080000000800000008000000080
                          000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000008000000080
                          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = btnUpSemRefClick
                      end
                      object btnDownSemRef: TSpeedButton
                        Left = 0
                        Top = 37
                        Width = 18
                        Height = 18
                        Hint = 'Vai para a próxima página'
                        Flat = True
                        Glyph.Data = {
                          36040000424D3604000000000000360000002800000010000000100000000100
                          2000000000000004000000000000000000000000000000000000FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000008000000080
                          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF000080000000800000008000000080
                          000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00008000000080000000800000008000000080
                          00000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF0000800000008000000080000000800000008000000080
                          0000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF000080000000800000008000000080000000800000008000000080
                          000000800000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00
                          FF00008000000080000000800000008000000080000000800000008000000080
                          00000080000000800000008000000080000000800000FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = btnDownSemRefClick
                      end
                    end
                  end
                  object TPage
                    Left = 0
                    Top = 0
                    Caption = 'nbpgValor'
                    object Label27: TLabel
                      Left = 10
                      Top = 4
                      Width = 30
                      Height = 13
                      Caption = 'Valor'
                      FocusControl = DBEdit4
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit20: TDBEdit
                      Left = 10
                      Top = 18
                      Width = 130
                      Height = 21
                      Color = 15658734
                      DataField = 'VALOR'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                    end
                  end
                  object TPage
                    Left = 0
                    Top = 0
                    Caption = 'nbpgReqMaterial'
                    object Label36: TLabel
                      Left = 263
                      Top = 4
                      Width = 92
                      Height = 13
                      Caption = 'Centro de Custo'
                      FocusControl = DBEdit26
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label41: TLabel
                      Left = 263
                      Top = 46
                      Width = 30
                      Height = 13
                      Caption = 'Valor'
                      FocusControl = DBEdit25
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label42: TLabel
                      Left = 10
                      Top = 46
                      Width = 98
                      Height = 13
                      Caption = 'Atividade Projeto'
                      FocusControl = DBEdit32
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label43: TLabel
                      Left = 10
                      Top = 4
                      Width = 107
                      Height = 13
                      Caption = 'Grupo de Produtos'
                      FocusControl = DBEdit33
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit26: TDBEdit
                      Left = 263
                      Top = 18
                      Width = 215
                      Height = 21
                      Color = 15658734
                      DataField = 'CCUSTO'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit31: TDBEdit
                      Left = 263
                      Top = 60
                      Width = 130
                      Height = 21
                      Color = 15658734
                      DataField = 'VALOR'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object DBEdit32: TDBEdit
                      Left = 10
                      Top = 60
                      Width = 215
                      Height = 21
                      Color = 15658734
                      DataField = 'UNIDNEGOC'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 2
                    end
                    object DBEdit33: TDBEdit
                      Left = 10
                      Top = 18
                      Width = 215
                      Height = 21
                      Color = 15658734
                      DataField = 'DESCGRUPOPROD'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 3
                    end
                  end
                  object TPage
                    Left = 0
                    Top = 0
                    Caption = 'nbpgSolicCompra'
                    object nbItensSolicCompra: TNotebook
                      Left = 0
                      Top = 0
                      Width = 485
                      Height = 89
                      Align = alClient
                      PageIndex = 1
                      TabOrder = 0
                      object TPage
                        Left = 0
                        Top = 0
                        Caption = 'pgSemRef1'
                        object Label35: TLabel
                          Left = 10
                          Top = 4
                          Width = 160
                          Height = 13
                          Caption = 'Centro de Responsabilidade'
                          FocusControl = DBEdit25
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label37: TLabel
                          Left = 263
                          Top = 46
                          Width = 30
                          Height = 13
                          Caption = 'Valor'
                          FocusControl = DBEdit25
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label38: TLabel
                          Left = 263
                          Top = 4
                          Width = 92
                          Height = 13
                          Caption = 'Centro de Custo'
                          FocusControl = DBEdit28
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit25: TDBEdit
                          Left = 10
                          Top = 18
                          Width = 215
                          Height = 21
                          Color = 15658734
                          DataField = 'CRESPON'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 0
                        end
                        object DBEdit27: TDBEdit
                          Left = 263
                          Top = 60
                          Width = 130
                          Height = 21
                          Color = 15658734
                          DataField = 'VALOR'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 1
                        end
                        object DBEdit28: TDBEdit
                          Left = 263
                          Top = 18
                          Width = 215
                          Height = 21
                          Color = 15658734
                          DataField = 'CCUSTO'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 2
                        end
                      end
                      object TPage
                        Left = 0
                        Top = 0
                        Caption = 'pgSemRef2'
                        object Label39: TLabel
                          Left = 10
                          Top = 4
                          Width = 107
                          Height = 13
                          Caption = 'Grupo de Produtos'
                          FocusControl = DBEdit29
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object Label40: TLabel
                          Left = 263
                          Top = 4
                          Width = 98
                          Height = 13
                          Caption = 'Atividade Projeto'
                          FocusControl = DBEdit30
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                        end
                        object DBEdit29: TDBEdit
                          Left = 10
                          Top = 18
                          Width = 215
                          Height = 21
                          Color = 15658734
                          DataField = 'DESCGRUPOPROD'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 0
                        end
                        object DBEdit30: TDBEdit
                          Left = 263
                          Top = 18
                          Width = 215
                          Height = 21
                          Color = 15658734
                          DataField = 'UNIDNEGOC'
                          DataSource = dtsRAD
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -9
                          Font.Name = 'MS Sans Serif'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ReadOnly = True
                          TabOrder = 1
                        end
                      end
                    end
                    object Panel22: TPanel
                      Left = 485
                      Top = 0
                      Width = 21
                      Height = 89
                      Align = alRight
                      BevelOuter = bvNone
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 1
                      object btnUpSolicCompra: TSpeedButton
                        Left = 0
                        Top = 19
                        Width = 18
                        Height = 18
                        Hint = 'Vai para a página anterior'
                        Flat = True
                        Glyph.Data = {
                          36040000424D3604000000000000360000002800000010000000100000000100
                          2000000000000004000000000000000000000000000000000000FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00008000000080000000800000008000000080000000800000008000000080
                          00000080000000800000008000000080000000800000FF00FF00FF00FF00FF00
                          FF00FF00FF000080000000800000008000000080000000800000008000000080
                          000000800000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF0000800000008000000080000000800000008000000080
                          0000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00008000000080000000800000008000000080
                          00000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF000080000000800000008000000080
                          000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000008000000080
                          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = btnUpSolicCompraClick
                      end
                      object btnDownSolicCompra: TSpeedButton
                        Left = 0
                        Top = 37
                        Width = 18
                        Height = 18
                        Hint = 'Vai para a próxima página'
                        Flat = True
                        Glyph.Data = {
                          36040000424D3604000000000000360000002800000010000000100000000100
                          2000000000000004000000000000000000000000000000000000FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000800000008000000080
                          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF000080000000800000008000000080
                          000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00008000000080000000800000008000000080
                          00000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF0000800000008000000080000000800000008000000080
                          0000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF000080000000800000008000000080000000800000008000000080
                          000000800000008000000080000000800000FF00FF00FF00FF00FF00FF00FF00
                          FF00008000000080000000800000008000000080000000800000008000000080
                          00000080000000800000008000000080000000800000FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                        ParentShowHint = False
                        ShowHint = True
                        OnClick = btnDownSolicCompraClick
                      end
                    end
                  end
                  object TPage
                    Left = 0
                    Top = 0
                    Caption = 'nbpgDestacamento'
                    object Label44: TLabel
                      Left = 10
                      Top = 4
                      Width = 92
                      Height = 13
                      Caption = 'Centro de Custo'
                      FocusControl = DBEdit40
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label45: TLabel
                      Left = 10
                      Top = 46
                      Width = 30
                      Height = 13
                      Caption = 'Valor'
                      FocusControl = DBEdit25
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label49: TLabel
                      Left = 263
                      Top = 4
                      Width = 160
                      Height = 13
                      Caption = 'Centro de Responsabilidade'
                      FocusControl = DBEdit45
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit40: TDBEdit
                      Left = 10
                      Top = 18
                      Width = 215
                      Height = 21
                      Color = 15658734
                      DataField = 'CCUSTO'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit41: TDBEdit
                      Left = 10
                      Top = 60
                      Width = 130
                      Height = 21
                      Color = 15658734
                      DataField = 'VALOR'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object DBEdit45: TDBEdit
                      Left = 263
                      Top = 18
                      Width = 215
                      Height = 21
                      Color = 15658734
                      DataField = 'CRESPON'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 2
                    end
                  end
                  object TPage
                    Left = 0
                    Top = 0
                    Caption = 'nbpgOrdemCompra'
                    object Label47: TLabel
                      Left = 10
                      Top = 4
                      Width = 107
                      Height = 13
                      Caption = 'Grupo de Produtos'
                      FocusControl = DBEdit43
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label48: TLabel
                      Left = 10
                      Top = 46
                      Width = 30
                      Height = 13
                      Caption = 'Valor'
                      FocusControl = DBEdit25
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit43: TDBEdit
                      Left = 10
                      Top = 18
                      Width = 215
                      Height = 21
                      Color = 15658734
                      DataField = 'DESCGRUPOPROD'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                    end
                    object DBEdit44: TDBEdit
                      Left = 10
                      Top = 60
                      Width = 130
                      Height = 21
                      Color = 15658734
                      DataField = 'VALOR'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 1
                    end
                  end
                  object TPage
                    Left = 0
                    Top = 0
                    Caption = 'nbpgCotacao'
                    object Label46: TLabel
                      Left = 10
                      Top = 4
                      Width = 107
                      Height = 13
                      Caption = 'Grupo de Produtos'
                      FocusControl = DBEdit42
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object DBEdit42: TDBEdit
                      Left = 10
                      Top = 18
                      Width = 215
                      Height = 21
                      Color = 15658734
                      DataField = 'DESCGRUPOPROD'
                      DataSource = dtsRAD
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                    end
                  end
                end
              end
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 519
                Height = 17
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' Detalhes do(s) processo(s) selecionados'
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
              end
              object GroupBox2: TGroupBox
                Left = 5
                Top = 153
                Width = 510
                Height = 94
                Caption = 'Etapa atual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
                object Label6: TLabel
                  Left = 7
                  Top = 53
                  Width = 34
                  Height = 13
                  Caption = 'Início'
                  FocusControl = DBEdit6
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lblFimEtapa: TLabel
                  Left = 136
                  Top = 53
                  Width = 69
                  Height = 13
                  Caption = 'Fim previsto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label11: TLabel
                  Left = 7
                  Top = 13
                  Width = 58
                  Height = 13
                  Caption = 'Descrição'
                  FocusControl = DBEdit11
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label22: TLabel
                  Left = 265
                  Top = 53
                  Width = 97
                  Height = 13
                  Caption = 'Grupo Aprovador'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBEdit6: TDBEdit
                  Left = 7
                  Top = 67
                  Width = 120
                  Height = 21
                  Color = 15658734
                  DataField = 'DATAINIETAPA'
                  DataSource = dtsRAD
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
                object dbedtFimEtapa: TDBEdit
                  Left = 136
                  Top = 67
                  Width = 120
                  Height = 21
                  Color = 15658734
                  DataField = 'DATAFIMPREVETAPA'
                  DataSource = dtsRAD
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object DBEdit11: TDBEdit
                  Left = 7
                  Top = 28
                  Width = 491
                  Height = 21
                  Color = 15658734
                  DataField = 'NOMEETAPA'
                  DataSource = dtsRAD
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object DBEdit15: TDBEdit
                  Left = 265
                  Top = 67
                  Width = 239
                  Height = 21
                  Color = 15658734
                  DataField = 'NOMEGRUPO'
                  DataSource = dtsRAD
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
              end
              object DBEdit1: TDBEdit
                Left = 5
                Top = 35
                Width = 118
                Height = 21
                Color = 15658734
                DataField = 'IDPROCESSO'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 0
              end
              object DBEdit3: TDBEdit
                Left = 136
                Top = 35
                Width = 118
                Height = 21
                Color = 15658734
                DataField = 'DATAINIPROCESSO'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 1
              end
              object dbedtFimRAD: TDBEdit
                Left = 267
                Top = 35
                Width = 118
                Height = 21
                Color = 15658734
                DataField = 'DATAFIMPREVPROC'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 2
              end
              object DBEdit12: TDBEdit
                Left = 396
                Top = 35
                Width = 118
                Height = 21
                Color = 15658734
                DataField = 'NOMEUSUARIO'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 3
              end
              object DBEdit5: TDBEdit
                Left = 5
                Top = 76
                Width = 376
                Height = 21
                Color = 15658734
                DataField = 'NOME'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 4
              end
              object DBMemo1: TDBMemo
                Left = 5
                Top = 118
                Width = 510
                Height = 32
                Color = 15658734
                DataField = 'OBS'
                DataSource = dtsRAD
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 6
              end
              object DBEdit2: TDBEdit
                Left = 396
                Top = 76
                Width = 118
                Height = 21
                Color = 15658734
                DataField = 'SITUACAO'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 5
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 246
              Height = 357
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object pnCheck: TPanel
                Left = 0
                Top = 274
                Width = 246
                Height = 83
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 0
                object grbCheck: TGroupBox
                  Left = 0
                  Top = 1
                  Width = 244
                  Height = 78
                  Caption = 'Exibir'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  object Panel6: TPanel
                    Left = 6
                    Top = 13
                    Width = 113
                    Height = 26
                    Hint = 
                      'Mostra na Grade os processos em atraso, dependentes de sua aprov' +
                      'ação'
                    BevelInner = bvLowered
                    BevelOuter = bvNone
                    Color = 12049407
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    object chkAtraso: TCheckBox
                      Left = 6
                      Top = 5
                      Width = 100
                      Height = 17
                      Hint = 'Exibe os processos que se encontram em atraso.'
                      Caption = 'Em Atraso'
                      Checked = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      State = cbChecked
                      TabOrder = 0
                      OnClick = chkEmDiaClick
                    end
                  end
                  object Panel5: TPanel
                    Left = 124
                    Top = 13
                    Width = 113
                    Height = 26
                    Hint = 
                      'Mostra na Grade os processos em dia, dependentes de sua aprovaçã' +
                      'o'
                    BevelInner = bvLowered
                    BevelOuter = bvNone
                    Color = clWhite
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    object chkEmDia: TCheckBox
                      Left = 6
                      Top = 5
                      Width = 100
                      Height = 17
                      Hint = 'Exibe os processos que se encontram em dia.'
                      Caption = 'Em Dia'
                      Checked = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      State = cbChecked
                      TabOrder = 0
                      OnClick = chkEmDiaClick
                    end
                  end
                  object Panel4: TPanel
                    Left = 6
                    Top = 45
                    Width = 113
                    Height = 26
                    Hint = 
                      'Mostra na Grade os processos atrasados, dependente da aprovação ' +
                      'de terceiros'
                    BevelInner = bvLowered
                    BevelOuter = bvNone
                    Color = 16777183
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    object chkTerceiros: TCheckBox
                      Left = 6
                      Top = 4
                      Width = 100
                      Height = 20
                      Hint = 'Exibe os processos dependentes de aprovações anteriores.'
                      Caption = 'Terceiros'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 0
                      OnClick = chkEmDiaClick
                    end
                  end
                  object Panel3: TPanel
                    Left = 124
                    Top = 45
                    Width = 113
                    Height = 26
                    Hint = 
                      'Mostra na Grade os processos em que você autoriza como substitut' +
                      'o'
                    BevelInner = bvLowered
                    BevelOuter = bvNone
                    Color = 14155775
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 3
                    object chkSubstituto: TCheckBox
                      Left = 6
                      Top = 5
                      Width = 100
                      Height = 17
                      Hint = 
                        'Exibe os processos em que o usuário atual apenas atua como subst' +
                        'ituto.'
                      Caption = 'Substituição'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 0
                      OnClick = chkEmDiaClick
                    end
                  end
                end
              end
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 246
                Height = 15
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' Processos pendentes de liberação'
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object wwdbgProcesso: TwwDBGrid
                Left = 0
                Top = 15
                Width = 246
                Height = 244
                Selected.Strings = (
                  'IDPROCESSO'#9'10'#9'Processo'
                  'NOME'#9'30'#9'Tipo de processo'
                  'DESCREFERENCIA'#9'30'#9'Referência'
                  'SITUACAO'#9'15'#9'Situação'
                  'CLASSIFEXIBICAO'#9'10'#9'Classificação'
                  'DATAINIPROCESSO'#9'17'#9'Início do processo'
                  'DATAFIMPREVPROC'#9'17'#9'Fim previsto do Processo'
                  'DATAFIMPROCESSO'#9'17'#9'Fim efetivo do processo'
                  'NOMEUSUARIO'#9'17'#9'Solicitante'
                  'OBS'#9'40'#9'Observação'
                  'NOMEETAPA'#9'30'#9'Etapa'
                  'DATAINIETAPA'#9'18'#9'Início da etapa'
                  'DATAFIMPREVETAPA'#9'18'#9'Fim previsto da etapa'#9'F'
                  'DATAFIMETAPA'#9'18'#9'Fim efetivo da etapa'#9'F'
                  'NUMERO'#9'10'#9'Número da Etapa')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                OnMultiSelectRecord = wwdbgProcessoMultiSelectRecord
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dtsRAD
                MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
                Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgMultiSelect]
                ReadOnly = True
                TabOrder = 2
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = True
                OnTitleButtonClick = wwdbgProcessoTitleButtonClick
                OnDrawDataCell = wwdbgProcessoDrawDataCell
                OnMouseDown = wwdbgProcessoMouseDown
                OnMouseUp = wwdbgProcessoMouseUp
                IndicatorColor = icBlack
              end
              object pnSel: TPanel
                Left = 0
                Top = 259
                Width = 246
                Height = 15
                Align = alBottom
                Alignment = taLeftJustify
                BevelOuter = bvLowered
                TabOrder = 3
              end
            end
          end
        end
      end
      object tabConsulta: TTabSheet
        Caption = 'Consultas'
        ImageIndex = 1
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 769
          Height = 42
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object Label12: TLabel
            Left = 4
            Top = 2
            Width = 53
            Height = 13
            Caption = 'Processo'
          end
          object Label14: TLabel
            Left = 103
            Top = 2
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object Label15: TLabel
            Left = 481
            Top = 2
            Width = 65
            Height = 13
            Caption = 'Data Início'
          end
          object Label16: TLabel
            Left = 628
            Top = 2
            Width = 77
            Height = 13
            Caption = 'Fim (previsto)'
          end
          object DBEdit8: TDBEdit
            Left = 4
            Top = 16
            Width = 85
            Height = 21
            Color = 15658734
            DataField = 'IDPROCESSO'
            DataSource = dtsRAD
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit34: TDBEdit
            Left = 102
            Top = 16
            Width = 361
            Height = 21
            Color = 15658734
            DataField = 'NOME'
            DataSource = dtsRAD
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit35: TDBEdit
            Left = 480
            Top = 16
            Width = 134
            Height = 21
            Color = 15658734
            DataField = 'DATAINIPROCESSO'
            DataSource = dtsRAD
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit36: TDBEdit
            Left = 628
            Top = 16
            Width = 134
            Height = 21
            Color = 15658734
            DataField = 'DATAFIMPREVPROC'
            DataSource = dtsRAD
            ReadOnly = True
            TabOrder = 3
          end
        end
        object pnlSub: TPanel
          Left = 0
          Top = 42
          Width = 769
          Height = 315
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object tabFluxo: TTabSheet
        Caption = 'Fluxo'
        ImageIndex = 2
        object Panel15: TPanel
          Left = 0
          Top = 0
          Width = 769
          Height = 357
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel13: TPanel
            Left = 0
            Top = 42
            Width = 769
            Height = 315
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter1: TSplitter
              Left = 0
              Top = 200
              Width = 769
              Height = 4
              Cursor = crVSplit
              Align = alTop
              Beveled = True
              ResizeStyle = rsUpdate
            end
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 769
              Height = 200
              Align = alTop
              BevelOuter = bvNone
              Constraints.MinHeight = 75
              ParentColor = True
              TabOrder = 0
              object GrdEtapa: TwwDBGrid
                Left = 0
                Top = 17
                Width = 769
                Height = 183
                Selected.Strings = (
                  'ETAPA'#9'30'#9'Etapa'#9'F'
                  'DATAINIETAPA'#9'16'#9'Início'#9'F'
                  'DATAFIMPREV'#9'16'#9'Término (Previsto)'#9'F'
                  'DATAFIMETAPA'#9'16'#9'Término (Efetivo)'#9'F'
                  'STATUSETAPA'#9'10'#9'Status'
                  'NOMEGRUPO'#9'16'#9'Grupo Aprovador')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsEtapa
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                TabOrder = 1
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icBlack
              end
              object Panel17: TPanel
                Left = 0
                Top = 0
                Width = 769
                Height = 17
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' Etapas do processo selecionado'
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
            end
            object Panel16: TPanel
              Left = 0
              Top = 204
              Width = 769
              Height = 111
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Splitter3: TSplitter
                Left = 497
                Top = 0
                Width = 4
                Height = 111
                Cursor = crHSplit
                Beveled = True
                ResizeStyle = rsUpdate
              end
              object plnBem: TPanel
                Left = 501
                Top = 0
                Width = 268
                Height = 111
                Align = alClient
                BevelInner = bvLowered
                TabOrder = 0
                object memOBS: TDBMemo
                  Left = 2
                  Top = 19
                  Width = 264
                  Height = 90
                  Align = alClient
                  Color = 14811135
                  DataField = 'OBSAUTORIZA'
                  DataSource = dsAut
                  MaxLength = 200
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
                object Panel20: TPanel
                  Left = 2
                  Top = 2
                  Width = 264
                  Height = 17
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = 'Observações da autorização selecionada'
                  Color = clGray
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object Panel18: TPanel
                Left = 0
                Top = 0
                Width = 497
                Height = 111
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object Panel19: TPanel
                  Left = 0
                  Top = 0
                  Width = 497
                  Height = 17
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = ' Autorizações da etapa selecionada'
                  Color = clGray
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                end
                object GrdAut: TwwDBGrid
                  Left = 0
                  Top = 17
                  Width = 497
                  Height = 94
                  Selected.Strings = (
                    'DATAHORA'#9'17'#9'Data de Autorização'#9'F'
                    'NOMEUSUARIO'#9'20'#9'Usuário'#9'F'
                    'STATUS'#9'17'#9'Status'#9'F'
                    'FLGRESSALVA'#9'11'#9'Ressalva'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsAut
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                  TabOrder = 1
                  TitleAlignment = taLeftJustify
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -9
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  TitleLines = 1
                  TitleButtons = False
                  UseTFields = False
                  IndicatorColor = icBlack
                end
              end
            end
          end
          object Panel21: TPanel
            Left = 0
            Top = 0
            Width = 769
            Height = 42
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 1
            object Label9: TLabel
              Left = 4
              Top = 2
              Width = 53
              Height = 13
              Caption = 'Processo'
            end
            object Label13: TLabel
              Left = 103
              Top = 2
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label17: TLabel
              Left = 481
              Top = 2
              Width = 65
              Height = 13
              Caption = 'Data Início'
            end
            object Label18: TLabel
              Left = 628
              Top = 2
              Width = 77
              Height = 13
              Caption = 'Fim (previsto)'
            end
            object DBEdit9: TDBEdit
              Left = 4
              Top = 16
              Width = 85
              Height = 21
              Color = 15658734
              DataField = 'IDPROCESSO'
              DataSource = dtsRAD
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit37: TDBEdit
              Left = 102
              Top = 16
              Width = 361
              Height = 21
              Color = 15658734
              DataField = 'NOME'
              DataSource = dtsRAD
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit38: TDBEdit
              Left = 480
              Top = 16
              Width = 134
              Height = 21
              Color = 15658734
              DataField = 'DATAINIPROCESSO'
              DataSource = dtsRAD
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit39: TDBEdit
              Left = 628
              Top = 16
              Width = 134
              Height = 21
              Color = 15658734
              DataField = 'DATAFIMPREVPROC'
              DataSource = dtsRAD
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
      end
      object tabAnexos: TTabSheet
        Caption = 'Anexos'
        ImageIndex = 3
        object pnlAnexos: TPanel
          Left = 0
          Top = 0
          Width = 769
          Height = 357
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object pnlBodyAnexos: TPanel
            Left = 0
            Top = 42
            Width = 769
            Height = 315
            Align = alClient
            TabOrder = 0
            object pnlDadosAnexo: TPanel
              Left = 1
              Top = 18
              Width = 767
              Height = 296
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Label28: TLabel
                Left = 16
                Top = 16
                Width = 58
                Height = 13
                Caption = 'Descrição'
                FocusControl = dbedtDescAnexo
              end
              object Label29: TLabel
                Left = 16
                Top = 80
                Width = 101
                Height = 13
                Caption = 'Nome do arquivo:'
                FocusControl = dbedtArqAnexo
              end
              object Label30: TLabel
                Left = 496
                Top = 16
                Width = 149
                Height = 13
                Caption = 'Data e hora da anexação:'
                FocusControl = dbedtDataHoraAnexo
              end
              object btnArquivo: TSpeedButton
                Left = 625
                Top = 96
                Width = 23
                Height = 22
                Hint = 'Selecionar arquivo'
                Flat = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000D8E9ECD8E9EC
                  D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
                  ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
                  E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
                  D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
                  ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
                  E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC000000000000
                  000000000000000000000000000000000000000000000000000000D8E9ECD8E9
                  ECD8E9ECD8E9ECD8E9EC00000000000000848400848400848400848400848400
                  8484008484008484008484000000D8E9ECD8E9ECD8E9ECD8E9EC00000000FFFF
                  0000000084840084840084840084840084840084840084840084840084840000
                  00D8E9ECD8E9ECD8E9EC000000FFFFFF00FFFF00000000848400848400848400
                  8484008484008484008484008484008484000000D8E9ECD8E9EC00000000FFFF
                  FFFFFF00FFFF0000000084840084840084840084840084840084840084840084
                  84008484000000D8E9EC000000FFFFFF00FFFFFFFFFF00FFFF00000000000000
                  000000000000000000000000000000000000000000000000000000000000FFFF
                  FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000D8E9ECD8E9
                  ECD8E9ECD8E9ECD8E9EC000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
                  FFFF00FFFFFFFFFF000000D8E9ECD8E9ECD8E9ECD8E9ECD8E9EC00000000FFFF
                  FFFFFF00FFFF000000000000000000000000000000000000000000D8E9ECD8E9
                  ECD8E9ECD8E9ECD8E9ECD8E9EC000000000000000000D8E9ECD8E9ECD8E9ECD8
                  E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
                  D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
                  ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
                  E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC}
                ParentShowHint = False
                ShowHint = True
                OnClick = btnArquivoClick
              end
              object DockOkCancelar: TDock97
                Left = 677
                Top = 0
                Width = 90
                Height = 296
                AllowDrag = False
                BoundLines = [blLeft]
                Position = dpRight
                object ToolbarOkCancelar: TToolbar97
                  Left = 0
                  Top = 0
                  DockPos = 0
                  TabOrder = 0
                  object btnOk: TBitBtn
                    Left = 0
                    Top = 0
                    Width = 85
                    Height = 27
                    Caption = 'OK'
                    TabOrder = 0
                    OnClick = btnOkClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
                      8000008000000080800080000000800080008080000080808000C0C0C0000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                      8888888888FFFFF8888888888000008888888888F777778FF888888002222200
                      88888887788888778F88887222222222088888788888888878F887A228822222
                      208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
                      22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
                      22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
                      220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
                      2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
                      8888888778FFFF77888888888777778888888888877777888888}
                    NumGlyphs = 2
                  end
                  object btnCancelar: TBitBtn
                    Left = 0
                    Top = 27
                    Width = 85
                    Height = 27
                    Cancel = True
                    Caption = 'Cancelar'
                    TabOrder = 1
                    OnClick = btnCancelarClick
                    Glyph.Data = {
                      76010000424D7601000000000000760000002800000020000000100000000100
                      0400000000000001000000000000000000001000000000000000000000000000
                      8000008000000080800080000000800080008080000080808000C0C0C0000000
                      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                      8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                      88888887788888778F88887991919191088888788888888878F8879919191919
                      108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                      19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                      19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                      190878F877787778887887917F919F71908887F88788878887F8879919191919
                      1088878F88888888878888799191919108888878FF88888F7888888779999977
                      8888888778FFFF77888888888777778888888888877777888888}
                    NumGlyphs = 2
                    Spacing = -1
                  end
                end
              end
              object dbedtDescAnexo: TDBEdit
                Left = 16
                Top = 32
                Width = 441
                Height = 21
                DataField = 'DESCRICAO'
                DataSource = dtsAnexos
                TabOrder = 0
              end
              object dbedtArqAnexo: TDBEdit
                Left = 16
                Top = 96
                Width = 607
                Height = 21
                DataField = 'NOMEARQUIVO'
                DataSource = dtsAnexos
                TabOrder = 2
              end
              object dbedtDataHoraAnexo: TDBEdit
                Left = 496
                Top = 32
                Width = 153
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'DATAHORA'
                DataSource = dtsAnexos
                ReadOnly = True
                TabOrder = 1
              end
            end
            object pnlGridAnexos: TPanel
              Left = 1
              Top = 18
              Width = 767
              Height = 296
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object dbgrdAnexos: TwwDBGrid
                Left = 0
                Top = 31
                Width = 767
                Height = 265
                Selected.Strings = (
                  'DATAHORA'#9'17'#9'Data/Hora'
                  'NOMEUSUARIO'#9'17'#9'Usuário'
                  'DESCRICAO'#9'34'#9'Descrição do anexo'
                  'NOMEARQUIVO'#9'33'#9'Nome do Arquivo')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dtsAnexos
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
                TabOrder = 1
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icBlack
              end
              object Dock: TDock97
                Left = 0
                Top = 0
                Width = 767
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object btnIncluirAnexo: TToolbarButton97
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir'
                    AllowAllUp = True
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = btnIncluirAnexoClick
                  end
                  object btnAlterarAnexo: TToolbarButton97
                    Left = 25
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Alterar'
                    AllowAllUp = True
                    ImageIndex = 1
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = btnAlterarAnexoClick
                  end
                  object btnExcluirAnexo: TToolbarButton97
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir'
                    AllowAllUp = True
                    ImageIndex = 2
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = btnExcluirAnexoClick
                  end
                  object ToolbarSep973: TToolbarSep97
                    Left = 75
                    Top = 0
                    Blank = True
                    SizeHorz = 10
                    SizeVert = 3
                  end
                  object sbtnSalvaAnexo: TToolbarButton97
                    Left = 85
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Salva o anexo'
                    AllowAllUp = True
                    ImageIndex = 9
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnSalvaAnexoClick
                  end
                  object sbtnVisualizaAnexo: TToolbarButton97
                    Left = 110
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Visualiza o anexo'
                    AllowAllUp = True
                    ImageIndex = 10
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnVisualizaAnexoClick
                  end
                end
              end
            end
            object pnlTopAnexos: TPanel
              Left = 1
              Top = 1
              Width = 767
              Height = 17
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = ' Anexos do processo selecionado'
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 769
            Height = 42
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 1
            object Label31: TLabel
              Left = 4
              Top = 2
              Width = 53
              Height = 13
              Caption = 'Processo'
            end
            object Label32: TLabel
              Left = 103
              Top = 2
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label33: TLabel
              Left = 481
              Top = 2
              Width = 65
              Height = 13
              Caption = 'Data Início'
            end
            object Label34: TLabel
              Left = 628
              Top = 2
              Width = 77
              Height = 13
              Caption = 'Fim (previsto)'
            end
            object DBEdit21: TDBEdit
              Left = 4
              Top = 16
              Width = 85
              Height = 21
              Color = 15658734
              DataField = 'IDPROCESSO'
              DataSource = dtsRAD
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit22: TDBEdit
              Left = 102
              Top = 16
              Width = 361
              Height = 21
              Color = 15658734
              DataField = 'NOME'
              DataSource = dtsRAD
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit24: TDBEdit
              Left = 480
              Top = 16
              Width = 134
              Height = 21
              Color = 15658734
              DataField = 'DATAINIPROCESSO'
              DataSource = dtsRAD
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit23: TDBEdit
              Left = 628
              Top = 16
              Width = 134
              Height = 21
              Color = 15658734
              DataField = 'DATAFIMPREVPROC'
              DataSource = dtsRAD
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
      end
    end
    object Panel11: TPanel
      Left = 304
      Top = 1
      Width = 472
      Height = 18
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 547
        Top = 0
        Width = 66
        Height = 18
        DataSource = dtsRAD
        VisibleButtons = [nbPrior, nbNext]
        Flat = True
        Hints.Strings = (
          'First record'
          'Registro Anrterior'
          'Próximo Registro'
          'Last record'
          'Insert record'
          'Delete record'
          'Edit record'
          'Post edit'
          'Cancel edit'
          'Refresh data')
        ParentShowHint = False
        ConfirmDelete = False
        ShowHint = True
        TabOrder = 0
      end
      object DBNavigator: TDBNavigator
        Left = 432
        Top = 0
        Width = 40
        Height = 18
        DataSource = dtsRAD
        VisibleButtons = [nbPrior, nbNext]
        Align = alRight
        Flat = True
        TabOrder = 1
        OnClick = DBNavigatorClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 779
    inherited tb97Fundo: TToolbar97
      Left = 607
      DockPos = 766
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230048
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 44
      DockPos = 203
      inherited ToolbarSep971: TToolbarSep97
        Left = 260
        SizeHorz = 5
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 395
        Top = 0
        Blank = True
        SizeHorz = 15
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 130
        Caption = '&Aprovar'
        Default = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 265
        Width = 130
        Caption = '&Recusar Processo'
        OnClick = bbtnCancelarClick
      end
      object bbtnVoltar: TBitBtn
        Left = 130
        Top = 0
        Width = 130
        Height = 33
        Caption = '&Voltar Etapa'
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnVoltarClick
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0000000000000000000000000000000C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFC0C0C080808080
          8080808080808080808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C000000000000093C9FF93C9FF93C9FF93C9FF93C9FF000000000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFC0C0C0808080808080C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          00000093C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF8080
          80C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFC0C0C0808080C0C0C0C0C0C0C0C0C0C0
          C0C0FFFFFFFFFFFFFFFFFFC0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0000000
          93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF80808000000080808093C9FFFFFF
          FF808080C0C0C0C0C0C0C0C0C0FFFFFF808080C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0FFFFFF808080808080808080C0C0C0FFFFFF808080C0C0C0C0C0C0000000
          93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF00000000000000000093C9FFFFFF
          FF808080C0C0C0C0C0C0FFFFFFC0C0C0808080C0C0C0FFFFFFC0C0C0C0C0C0C0
          C0C0FFFFFF808080808080808080C0C0C0C0C0C0808080C0C0C000000093C9FF
          93C9FF93C9FF00000093C9FF93C9FF93C9FF00000000000000000093C9FF93C9
          FFFFFFFF808080C0C0C0FFFFFF808080C0C0C0C0C0C0FFFFFF808080C0C0C0C0
          C0C0FFFFFF808080808080808080C0C0C0C0C0C0FFFFFF80808000000093C9FF
          93C9FF93C9FF00000000000093C9FF80808000000000000000000093C9FF93C9
          FFFFFFFF808080C0C0C0FFFFFF808080C0C0C0C0C0C0FFFFFF808080808080C0
          C0C0808080808080808080808080C0C0C0C0C0C0FFFFFF80808000000093C9FF
          93C9FF93C9FF00000000000000000000000000000000000093C9FF93C9FF93C9
          FFFFFFFF808080C0C0C0FFFFFF808080C0C0C0C0C0C0FFFFFF80808080808080
          8080808080808080808080C0C0C0C0C0C0C0C0C0FFFFFF80808000000093C9FF
          93C9FF93C9FF00000000000000000000000080808093C9FF93C9FF93C9FF93C9
          FFFFFFFF808080C0C0C0FFFFFF808080C0C0C0C0C0C0FFFFFF80808080808080
          8080808080808080C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF80808000000093C9FF
          93C9FF93C9FF00000000000000000000000000000093C9FF93C9FF93C9FF93C9
          FFFFFFFF808080C0C0C0C0C0C0808080C0C0C0C0C0C0FFFFFF80808080808080
          8080808080808080C0C0C0C0C0C0C0C0C0FFFFFFC0C0C0808080C0C0C0000000
          93C9FF93C9FF80808000000000000000000000000000000093C9FF93C9FFFFFF
          FF808080C0C0C0C0C0C0C0C0C0FFFFFF808080C0C0C0C0C0C080808080808080
          8080808080808080808080C0C0C0C0C0C0FFFFFF808080C0C0C0C0C0C0000000
          93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FFFFFF
          FF808080C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFC0C0C0808080C0C0C0C0C0C0C0C0C0
          00000093C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FFFFFFFFFFFFFF8080
          80C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFFC0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0FFFFFFFFFFFFC0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080FFFFFFFF
          FFFFFFFFFFFFFFFFC0C0C0808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0808080808080808080808080808080C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808080
          8080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        NumGlyphs = 2
      end
    end
    object TB97Consultar: TToolbar97
      Left = 458
      Top = 0
      Caption = 'TB97Consultar'
      DockPos = 617
      TabOrder = 2
      Visible = False
      object ToolbarSep974: TToolbarSep97
        Left = 130
        Top = 0
        Blank = True
        SizeHorz = 15
      end
      object bbtnConsultar: TBitBtn
        Left = 0
        Top = 0
        Width = 130
        Height = 33
        Caption = '&Consultar'
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = bbtnConsultarClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
          840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
          0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF0000008400FF00
          FF00FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
          FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
          8400FF00FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
          840000008400FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
          0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
          8400000084000000840000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF000000840000000000FFFF0000FF00FF00FFFF0000FF00FF00000000008484
          0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
          0000FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00
          FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
          0000FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
          000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FF00FF00FFFF0000FF00FF00FFFF000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 227
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsRad: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPROCESSO'
        DataType = ftFloat
      end
      item
        Name = 'DATAINIPROCESSO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAFIMPREV'
        DataType = ftDateTime
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'OBS'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NOMEETAPA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATAINIETAPA'
        DataType = ftDateTime
      end
      item
        Name = 'DATAFIMETAPA'
        DataType = ftDateTime
      end
      item
        Name = 'DATAFIMPREV_1'
        DataType = ftDateTime
      end
      item
        Name = 'NOMEUSUARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCREFERENCIA'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsRadAfterOpen
    AfterScroll = cdsRadAfterScroll
    Left = 21
    Top = 161
  end
  object dtsRAD: TwwDataSource
    AutoEdit = False
    DataSet = cdsRad
    Left = 32
    Top = 97
  end
  object dsEtapa: TwwDataSource
    AutoEdit = False
    DataSet = cdsEtapa
    Left = 97
    Top = 114
  end
  object cdsEtapa: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsEtapaAfterOpen
    AfterScroll = cdsEtapaAfterScroll
    Left = 133
    Top = 209
  end
  object dsAut: TwwDataSource
    AutoEdit = False
    DataSet = CdsAut
    Left = 73
    Top = 346
  end
  object CdsAut: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAutAfterOpen
    Left = 33
    Top = 346
  end
  object ImlPadrao: TImageList
    Left = 296
    Top = 7
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D9D8D70045423C0045423C00B3B2AF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005856510058565100585651005856
      5100585651005856510058565100585651005856510058565100585651005856
      510058565100373636008C8B8B0035322B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6000000000000848400000000000000000058565100D6D6D200D5D5D200D4D4
      D100D3D3D000D2D2D000D1D1CF00D1D1CE00D0D0CD00CFCFCD00CECECC00CDCD
      CB0035353500787878006C6A69004F4C46000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6000000000000848400000000000000000058565100DADAD500D9D9D500D8D8
      D400D7D7D300D6D6D300D5D5D200D4D4D100D4D4D000D3D3D000D2D2CF005C5C
      5B008080810070706E003E3C3600D9D8D7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C6000000000000848400000000000000000058565100DDDDD900DCDCD800DCDC
      D700DBDBD600B3B3AF00777776007B797800706E6D0076767500A9A9A7006C6C
      6D007A7A79003E3C3600D9D8D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000848400000000000000000058565100E1E1DC00CBCBCB00C2C2
      C2009797990091919100CECDCC00C6C0B400BDB8AB00B0AFAF0078777700908E
      8D00585651000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000058565100E5E5DF00CECECE009D9D
      9D00898A9500D3CEC300EDD8AC00F9DEA700ECD09200BAAC8300B1AFAC006D6C
      6C00585651000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      00000084840000848400000000000000000058565100E9E9E200E8E8E1009C9C
      9900C1BCBA00B8B8B800C3C3C300BDBDBD00B0B0B000A0A0A0008A8A8A008F8C
      8C00585651000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000058565100ECECE500CECECE009D9D
      9D00AE988C00B2B2B200ADADAD00A7A7A700A1A1A1009B9B9B00ABABAB00928B
      8400585651000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000058565100EFEFE700E1E1E3009696
      9800AB927300F0E2D100DDDDDF00E1D3C700EDD6AE00F7E1AF00EEE0BB009D99
      9400585651000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000058565100EFEFE700E1E1E300A9A9
      AB008B868500D6A56800FBEFDC00FCF1DB00FCEED200F5DFAE00E7D19F008C8C
      8C00585651000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000848400000000000000000058565100EFEFE700CECECE00C7C7
      C70091919100AA9D8F00DEB07200F0D19E00F3D5A000E7CB9800ACAAA700A0A0
      9E00585651000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6000000000000000000000000000000000058565100EFEFE700EFEFE700EFEF
      E700EFEFE700BCBCB700ACABA900A0988D00A49F9800A3A3A300EFEFE700EFEF
      E700585651000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000C6C6C600000000000000000058565100EFEFE700EFEFE700EFEF
      E700EFEFE700EFEFE700EFEFE700EFEFE700EFEFE700EFEFE700EFEFE700EFEF
      E700585651000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000058565100EFEFE700EFEFE700EFEF
      E700EFEFE700EFEFE700EFEFE700EFEFE700EFEFE700EFEFE700EFEFE700EFEF
      E700585651000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A99960058565100585651005856
      5100585651005856510058565100585651005856510058565100585651005856
      51009A9996000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFF00000FFFFC00100000000
      FFFF800100000000FFFF800100000000FFFF800100010000FFFF800100070000
      E007800100070000F00F800100070000F81F800100070000FC3F800100070000
      FE7F800100070000FFFF800100070000FFFF800100070000FFFF800100070000
      FFFF800100070000FFFFFFFF00070000FC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  object dtsAnexos: TDataSource
    DataSet = cdsAnexos
    Left = 94
    Top = 288
  end
  object cdsAnexos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsAnexosAfterOpen
    AfterScroll = cdsAnexosAfterScroll
    Left = 37
    Top = 289
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.*'
    Filter = 'Todos os arquivos (*.*)|*.*'
    FilterIndex = 0
    Title = 'Selecione o arquivo a anexar...'
    Left = 630
    Top = 213
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.*'
    Filter = 'Todos os arquivos (*.*)|*.*'
    Title = 'Indique o arquivo a ser salvo...'
    Left = 630
    Top = 277
  end
end
