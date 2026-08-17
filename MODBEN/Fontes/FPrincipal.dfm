inherited frmPrincipal: TfrmPrincipal
  Left = 130
  Top = 164
  Caption = 'Módulo de Benefícios Sociais'
  ClientHeight = 321
  ClientWidth = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 552
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 301
    Width = 552
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
        Width = '200'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'PnlUsuario_Padrao'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '200'
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
        Text = '09/09/2003 10:07'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  object UsuarioRH: TPanel [3]
    Left = 375
    Top = 42
    Width = 94
    Height = 22
    Caption = 'UsuarioRH'
    TabOrder = 3
    Visible = False
  end
  inherited mnu: TMainMenu
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          Visible = False
        end
        inherited MnuSep2_padrao: TMenuItem
          Visible = False
        end
      end
    end
    inherited mnuCadastro: TMenuItem [1]
      HelpContext = 710001
      object mnuTiposdeBeneficio: TMenuItem
        Caption = 'Tipos de &Benefício'
        HelpContext = 710002
        OnClick = mnuTiposdeBeneficioClick
      end
      object mnuRubricasSalariais: TMenuItem
        Caption = '&Rubricas Salariais'
        HelpContext = 710003
        OnClick = mnuRubricasSalariaisClick
      end
      object mnuRubricasporEmpresa: TMenuItem
        Caption = 'Rubricas por &Empresa'
        HelpContext = 710004
        OnClick = mnuRubricasporEmpresaClick
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = '&Transações'
      HelpContext = 710005
      object mnuRegistrodeBeneficios: TMenuItem
        Caption = '&Registro de Benefícios'
        HelpContext = 710006
        OnClick = mnuRegistrodeBeneficiosClick
      end
    end
    inherited mnuConsulta: TMenuItem [3]
      inherited Relatorios1: TMenuItem
        Caption = '&Relatórios '
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuHistoricodeBeneficios: TMenuItem
        Caption = '&Histórico de Benefícios'
        HelpContext = 710007
        OnClick = mnuHistoricodeBeneficiosClick
      end
    end
    object mnuRelatorios: TMenuItem [4]
      Caption = '&Gráficos Fixos'
      HelpContext = 710008
      object mnuEstatisticadeBeneficios: TMenuItem
        Caption = '&Estatística de Benefícios'
        HelpContext = 710009
        OnClick = mnuEstatisticadeBeneficiosClick
      end
    end
    inherited Edit1: TMenuItem [5]
    end
  end
  inherited AclPadrao: TActionList
    Left = 40
    Top = 136
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 88
    Top = 232
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{57A23F95-F5DC-434D-84BD-6D0926F8FB3B}'
    ServerName = 'CmModBenSvr50.DmCmModBenSvr50'
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{57A23F95-F5DC-434D-84BD-6D0926F8FB3B}'
    ServerName = 'CmModBenSvr50.DmCmModBenSvr50'
  end
  inherited Web: TWebConnection
    ServerGUID = '{57A23F95-F5DC-434D-84BD-6D0926F8FB3B}'
    ServerName = 'CmModBenSvr50.DmCmModBenSvr50'
  end
end
