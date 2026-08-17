inherited frmPrincipal: TfrmPrincipal
  Left = 300
  Top = 142
  Caption = 'Gerador de Relatórios, Consultas e Gráficos'
  ClientHeight = 364
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    inherited tb97Atalho: TToolbar97
      inherited sbtnFluxOper: TToolbarButton97
        Left = 104
      end
      inherited sbtnMudaEmpresa: TToolbarButton97
        Left = 126
      end
      inherited sbtnListaMensagens: TToolbarButton97
        Left = 179
      end
      inherited sepCM2: TToolbarSep97
        Left = 171
      end
      inherited sbtnEnviaMensagens: TToolbarButton97
        Left = 201
      end
      object ToolbarSep971: TToolbarSep97
        Left = 96
        Top = 0
        Blank = True
        SizeHorz = 8
      end
      object BtnDesign: TToolbarButton97
        Left = 148
        Top = 0
        Width = 23
        Height = 22
        Hint = 'Área de Trabalho'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF005555555B5555
          55555B5555BB775555B555BB5500F055BB5555BB00FFF0BBBB555500FFFFFF0B
          B555557FFFFC8F0B5555557FFCCFFFF0B55555B7FFFFC8F0BB55BBB7FFCCFFFF
          0BBB55BB7FFFFC8FF055555B7FFCCFFFFF05555BB7FFFFFF775555BBBB7FFF77
          BB5555BB55B77755BB555B55555B555555B55555555B55555555}
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnDesignClick
      end
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 168
    Top = 72
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 344
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlEmpresa_Padrao'
        Tag = 0
        Text = 'Empresa'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '310'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlUsuario_Padrao'
        Tag = 0
        Text = 'Usuario'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '140'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel0'
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '64'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel1'
        Style = psCapsLock
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '40'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel2'
        Style = psNumLock
        Tag = 0
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        Width = '40'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlDateTime'
        Style = psDateTime
        Tag = 0
        Text = '12/11/2015 11:38'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 394
    Top = 275
  end
  inherited mnu: TMainMenu
    Left = 234
    Top = 275
    inherited mnuSistema: TMenuItem
      inherited mnuUtilitario: TMenuItem
        object MenuSep: TMenuItem
          Caption = '-'
        end
        object MnutransfRelat: TMenuItem
          Caption = '&Transferência de Relatórios'
          OnClick = MnutransfRelatClick
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      object Grupos2: TMenuItem
        Caption = '&Grupos'
        OnClick = Grupos2Click
      end
      object Consultas1: TMenuItem
        Caption = '&Consultas'
        OnClick = Consultas1Click
      end
      object Manuteno1: TMenuItem
        Caption = '&Relatórios'
        OnClick = Manuteno1Click
      end
      object mnuGraficos: TMenuItem
        Caption = '&Gráficos'
        OnClick = mnuGraficosClick
      end
      object mnuExpotar1: TMenuItem
        Caption = 'Exportar'
        OnClick = mnuExpotar1Click
      end
      object mnuImportar: TMenuItem
        Caption = 'Importar'
        OnClick = mnuImportarClick
      end
    end
    inherited mnuConsulta: TMenuItem
      object Etiquetas1: TMenuItem
        Caption = '&Etiquetas'
        object Configurao1: TMenuItem
          Caption = '&Configuração'
          OnClick = Configurao1Click
        end
        object Impresso1: TMenuItem
          Caption = '&Impressão'
          OnClick = Impresso1Click
        end
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 427
    Top = 275
  end
  inherited AppPadrao: TCMApplicationEvents
    Left = 536
    Top = 276
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{3BC47A92-E9D1-4D06-A585-939A72EC8FA8}'
    ServerName = 'CmRelatorioSrvr50.DRelatorioSrvr'
    Host = 'localhost'
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{3BC47A92-E9D1-4D06-A585-939A72EC8FA8}'
    ServerName = 'CmRelatorioSrvr50.DRelatorioSrvr'
  end
  inherited Web: TWebConnection
    ServerGUID = '{3BC47A92-E9D1-4D06-A585-939A72EC8FA8}'
    ServerName = 'CmRelatorioSrvr50.DRelatorioSrvr'
  end
  inherited CorreioCM: TCorreioCM
    Left = 494
    Top = 275
  end
  object qryWorkFlow: TwwQuery
    ValidateWithMask = True
    Left = 193
    Top = 275
  end
  object dsWorkFlow: TwwDataSource
    Left = 159
    Top = 275
  end
end
