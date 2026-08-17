inherited frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 33
  Caption = 'Global'
  ClientHeight = 634
  ClientWidth = 1264
  Visible = False
  OnShow = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock97Top: TDock97
    Width = 1264
    inherited fcLabel2: TfcLabel
      Top = 1
      OnDblClick = fcLabel2DblClick
    end
    inherited tb97Atalho: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 139
    Top = 130
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 614
    Width = 1264
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
        Text = '13/12/2019 10:51'
        TextOptions.Alignment = taRightJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 31
  end
  inherited mnu: TMainMenu
    Left = 31
    Top = 185
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object ConsultaLogTabelas1: TMenuItem [0]
          Caption = '&Consultar Log Tabelas'
          HelpContext = 20001
          OnClick = ConsultaLogTabelas1Click
        end
        object ExcluiLogTabelas1: TMenuItem [1]
          Caption = '&Excluir Log Tabelas'
          HelpContext = 20002
          OnClick = ExcluiLogTabelas1Click
        end
        object N2: TMenuItem [2]
          Caption = '-'
        end
        object AssociaPessoaXMduloResponsvel1: TMenuItem [3]
          Caption = 'Associar Pessoa X Módulo Responsável'
          HelpContext = 20003
          OnClick = AssociaPessoaXMduloResponsvel1Click
        end
        object N1: TMenuItem [4]
          Caption = '-'
        end
        object N3: TMenuItem
          Caption = '-'
        end
        object Importaodecotaes1: TMenuItem
          Caption = '&Importação de Cotações'
          OnClick = Importaodecotaes1Click
        end
        object DeParadeExportaes1: TMenuItem
          Caption = '&De/Para de Exportações'
          OnClick = DeParadeExportaes1Click
        end
      end
    end
    inherited mnuCadastro: TMenuItem
      HelpContext = 20004
      object Moeda1: TMenuItem
        Caption = '&Moeda'
        HelpContext = 20005
        object Cotao1: TMenuItem
          Caption = '&Cotação'
          HelpContext = 20006
          OnClick = Cotao1Click
        end
        object Qualificao1: TMenuItem
          Caption = '&Qualificação'
          HelpContext = 20007
          OnClick = Qualificao1Click
        end
        object UsuariosporQualificacaodeMoeda1: TMenuItem
          Caption = 'Usuários por &Qualificação de Moeda'
          OnClick = UsuariosporQualificacaodeMoeda1Click
        end
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object CentrosdeResponsabilidade1: TMenuItem
        Caption = 'Centro de Responsabilidade'
        object mnuCadPlanCentRespon: TMenuItem
          Caption = 'Planos de Centros de Responsabilidade'
          OnClick = mnuCadPlanCentResponClick
        end
        object CentrodeResponsabilidade1: TMenuItem
          Caption = 'Centro de &Responsabilidade'
          HelpContext = 20008
          OnClick = CentrodeResponsabilidade1Click
        end
        object UsuariosporCentrodeResponsabilidade1: TMenuItem
          Caption = 'Usuários por Centro de &Responsabilidade'
          OnClick = UsuariosporCentrodeResponsabilidade1Click
        end
        object CentrodeResponsabilidadePorUsurios1: TMenuItem
          Caption = 'Centro de Re&sponsabilidade Por Usuários'
          OnClick = CentrodeResponsabilidadePorUsurios1Click
        end
      end
      object CentrodeCustos1: TMenuItem
        Caption = 'Centro de Custo'
        object mnuCadPlanCentCust: TMenuItem
          Caption = 'Planos de Centros de Custo'
          OnClick = mnuCadPlanCentCustClick
        end
        object CentrodeResultado1: TMenuItem
          Caption = '&Centro de Custo'
          HelpContext = 20009
          OnClick = CentrodeResultado1Click
        end
        object mnuUsuxCCusto: TMenuItem
          Caption = '&Usuarios por Centro de Custo'
          HelpContext = 20021
          OnClick = mnuUsuxCCustoClick
        end
        object CentrodeCustoPorUsurios1: TMenuItem
          Caption = 'Centro de Cus&to Por Usuários'
          OnClick = CentrodeCustoPorUsurios1Click
        end
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Pas1: TMenuItem
        Caption = '&País'
        HelpContext = 20010
        OnClick = Pas1Click
      end
      object Estado1: TMenuItem
        Caption = '&Estado'
        HelpContext = 20011
        OnClick = Estado1Click
      end
      object Cidades1: TMenuItem
        Caption = 'Cidade&s'
        HelpContext = 20012
        OnClick = Cidades1Click
      end
      object Feriados1: TMenuItem
        Caption = 'Feri&ados'
        HelpContext = 20013
        OnClick = Feriados1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object TipodeOperao1: TMenuItem
        Caption = 'Tipo de &Operação'
        HelpContext = 20014
        OnClick = TipodeOperao1Click
      end
      object AtividadesProjetos1: TMenuItem
        Caption = 'Atividades/Pro&jetos'
        HelpContext = 20015
        OnClick = AtividadesProjetos1Click
      end
      object TipodeDocumento1: TMenuItem
        Caption = '&Tipo de Documentação'
        HelpContext = 20016
        OnClick = TipodeDocumento1Click
      end
      object RamodeF1: TMenuItem
        Caption = 'Ramo de For&necedores'
        HelpContext = 20017
        OnClick = RamodeF1Click
      end
      object Fornecedores1: TMenuItem
        Caption = '&Fornecedores/Favorecido'
        HelpContext = 20018
        OnClick = Fornecedores1Click
      end
      object TipodeCliente1: TMenuItem
        Caption = 'Tipo de Cl&iente'
        HelpContext = 20019
        OnClick = TipodeCliente1Click
      end
      object TipodeClienteporHoteleContaContabil1: TMenuItem
        Caption = 'Tipo de Cliente por &Hotel e Conta Contábil'
        Visible = False
        OnClick = TipodeClienteporHoteleContaContabil1Click
      end
      object Clientes1: TMenuItem
        Caption = 'C&lientes'
        HelpContext = 20020
        OnClick = Clientes1Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object Bancos1: TMenuItem
        Caption = '&Bancos'
        HelpContext = 20022
        OnClick = Bancos1Click
      end
      object MnuPracadeCompensacao1: TMenuItem
        Caption = 'P&raça de Compensação'
        HelpContext = 20027
        OnClick = MnuPracadeCompensacao1Click
      end
      object Agncia1: TMenuItem
        Caption = 'A&gência'
        HelpContext = 20023
        OnClick = Agncia1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuCadPatro: TMenuItem
        Caption = 'Patrocinadora'
        OnClick = mnuCadPatroClick
      end
      object mnuCadPlanPrev: TMenuItem
        Caption = 'Plano Previdenciário'
        OnClick = mnuCadPlanPrevClick
      end
      object MnuProgramas: TMenuItem
        Caption = 'Programas Previ&denciário'
        OnClick = MnuProgramasClick
      end
      object MnuPlanoPrevidenciarioContabil: TMenuItem
        Caption = 'Plano Pre&videnciário Contábil'
        OnClick = MnuPlanoPrevidenciarioContabilClick
      end
      object mnuPlanoPrevidencirioXPatrocinadora1: TMenuItem
        Caption = 'Plano Previdenciário X Patrocinadora'
        OnClick = mnuPlanoPrevidencirioXPatrocinadora1Click
      end
      object mnuNaturezaContr: TMenuItem
        Caption = 'Tipo de Natureza do Contrato'
        OnClick = mnuNaturezaContrClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mnuIntegraoOramentriaFDO1: TMenuItem
        Caption = 'Integração Orçamentária - FDO'
        OnClick = mnuIntegraoOramentriaFDO1Click
      end
    end
    object Ferramentas1: TMenuItem [3]
      Caption = '&Ferramentas'
      HelpContext = 20024
      object Importadefiniesderelatorio1: TMenuItem
        Caption = '&Importa Definições de Dados CM Soluções'
        HelpContext = 230058
        OnClick = Importadefiniesderelatorio1Click
      end
      object RestauraAutorizao1: TMenuItem
        Caption = 'Restaura Autorização'
        OnClick = RestauraAutorizao1Click
      end
    end
    object mnuDePara: TMenuItem [4]
      Caption = 'De/Para'
      object mnuDeParaCR: TMenuItem
        Caption = 'Centros de Responsabilidade'
        object mnuCadDeParaCR: TMenuItem
          Caption = 'De/Para'
          OnClick = mnuCadDeParaCRClick
        end
        object mnuCadTabelaDeParaCR: TMenuItem
          Caption = 'Tabelas e Campos'
          OnClick = mnuCadTabelaDeParaCRClick
        end
        object mnuCadCampoDeParaCR: TMenuItem
          Caption = 'Campos'
          Enabled = False
          Visible = False
        end
        object N11: TMenuItem
          Caption = '-'
          Enabled = False
          Visible = False
        end
        object mnuExecDeParaCR: TMenuItem
          Caption = 'Executa De/Para de Centros de Responsabilidade'
          OnClick = mnuExecDeParaCRClick
        end
      end
      object mnuDeParaCC: TMenuItem
        Caption = 'Centros de Custo'
        object mnuCadDeParaCC: TMenuItem
          Caption = 'De/Para'
          OnClick = mnuCadDeParaCCClick
        end
        object mnuCadTabelaDeParaCC: TMenuItem
          Caption = 'Tabelas e Campos'
          OnClick = mnuCadTabelaDeParaCCClick
        end
        object mnuCadCampoDeParaCC: TMenuItem
          Caption = 'Campos'
          Enabled = False
          Visible = False
        end
        object N10: TMenuItem
          Caption = '-'
          Enabled = False
          Visible = False
        end
        object mnuExecDeParaCC: TMenuItem
          Caption = 'Executa De/Para de Centros de Custo'
          OnClick = mnuExecDeParaCCClick
        end
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited MnuLogdeOperaes_Padrao: TMenuItem
        HelpContext = 230059
      end
    end
    object mnuGetif: TMenuItem [6]
      Caption = '&GETIF'
      object mnuAutorizacao: TMenuItem
        Caption = 'Autorização'
        object mnuFormulario: TMenuItem
          Caption = '&Formulário'
          OnClick = mnuFormularioClick
        end
        object mnuOperacao: TMenuItem
          Caption = '&Operação'
          OnClick = mnuOperacaoClick
        end
        object mnuObjeto: TMenuItem
          Caption = 'O&bjeto'
          OnClick = mnuObjetoClick
        end
        object mnuFuncaoxOperacao: TMenuItem
          Caption = 'F&unção x Operação'
          OnClick = mnuFuncaoxOperacaoClick
        end
      end
      object mnuUsuarioLiberado: TMenuItem
        Caption = 'Usuário Liberado'
        OnClick = mnuUsuarioLiberadoClick
      end
    end
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 31
  end
  inherited ImlPadrao: TImageList
    Left = 31
  end
  inherited AclPadrao: TActionList
    Left = 31
  end
  inherited AppPadrao: TCMApplicationEvents
    OnPrintReportPadrao = AppPadraoPrintReportPadrao
    OnConfigReportPadrao = AppPadraoConfigReportPadrao
    Left = 106
    Top = 40
  end
  inherited Skt: TSocketConnection
    ServerGUID = '{C9753E4E-B537-4996-B538-BFD595E207BA}'
    ServerName = 'CMGlobalSrvr50.DtmGlobalSrvr'
    Left = 232
    Top = 240
  end
  inherited Dcom: TDCOMConnection
    ServerGUID = '{C9753E4E-B537-4996-B538-BFD595E207BA}'
    ServerName = 'CMGlobalSrvr50.DtmGlobalSrvr'
    Left = 288
    Top = 240
  end
  inherited Web: TWebConnection
    ServerGUID = '{C9753E4E-B537-4996-B538-BFD595E207BA}'
    ServerName = 'CMGlobalSrvr50.DtmGlobalSrvr'
    Left = 344
    Top = 240
  end
  inherited CorreioCM: TCorreioCM
    Left = 31
    Top = 137
  end
  inherited ResourceManager: TCMResourceManager
    Left = 208
    Top = 48
  end
end
