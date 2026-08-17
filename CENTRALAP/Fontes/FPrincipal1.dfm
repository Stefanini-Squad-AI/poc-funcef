inherited frmPrincipal: TfrmPrincipal
  Left = 65
  Top = 40
  Caption = 'Folha de Benefícios'
  ClientHeight = 562
  ClientWidth = 692
  PixelsPerInch = 96
  TextHeight = 13
  object ConsPart1: TConsPart [0]
    Left = 217
    Top = 342
    Width = 25
    Height = 25
    Glyph.Data = {
      96010000424D9601000000000000760000002800000018000000180000000100
      0400000000002001000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00188888880FFF
      F0FFF0FF073888888880FFFFFF0FFFF073808888880FFFFFFFF0FF07380F8888
      80FFFF000000807380FF88880FF00000000007380FFF8880FF00000000000380
      FF0F880FF00077FFF8877030FFF080FFF00E8FF888888700FFFF0FFF00EEF888
      87477870F0FF80FF0EFF8888887477870F0F880F0EF88888888747870FF08880
      0EF88888888748870FFF88880E888F8888787F870FFF88880E888FF8888F8F87
      0FFF88880E788EFEFFF8F870FFFF888887E788FFEF8F87E0FFF08888807E7888
      FF887E0FFF0888888807E777777EE0FFF0888888888007E7E7E00FFF08888888
      88888000000FFFF088888888888888880FFFFF08888888888888888880FFF088
      8888888888888888880F08888888888888888888888088888888}
    Visible = False
  end
  inherited Dock97Top: TDock97
    Width = 692
  end
  inherited tb97FluxOper: TToolWindow97
    Left = 255
    Top = 54
  end
  inherited stbarStatusBar: TfcStatusBar
    Top = 542
    Width = 692
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Name = 'Panel0'
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
        Name = 'Panel1'
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
        Name = 'Panel2'
        Style = psHint
        Tag = 0
        Text = '11/04/2001 22:50'
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '50'
      end>
  end
  object Button1: TButton [4]
    Left = 568
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Tela'
    TabOrder = 3
    Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 49
  end
  inherited mnu: TMainMenu
    Left = 27
    Top = 400
    inherited mnuSistema: TMenuItem
      inherited mnuConfiguracao: TMenuItem
        inherited nmuConfigParametros: TMenuItem
          OnClick = nmuConfigParametrosClick
        end
      end
      inherited mnuUtilitario: TMenuItem
        object VerificaPessoa1: TMenuItem
          Caption = 'Verifica Pessoa '
        end
        object mnuVerificaContaBancaria: TMenuItem
          Caption = 'Verifica Conta Bancária'
          OnClick = mnuVerificaContaBancariaClick
        end
        object mnuComparaArquivosdeBanco: TMenuItem
          Caption = 'Compara Arquivos de Banco'
          OnClick = mnuComparaArquivosdeBancoClick
        end
        object ContraChequeTrimestral1: TMenuItem
          Caption = 'Contra-Cheque Trimestral'
          OnClick = ContraChequeTrimestral1Click
        end
      end
    end
    object mnuTransacoes: TMenuItem [2]
      Caption = 'Cálculos da Folha'
      OnClick = mnuTransacoesClick
      object mnuPreparo: TMenuItem
        Caption = 'Preparo'
        OnClick = mnuPreparoClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Prvia3: TMenuItem
        Caption = 'Prévia'
        object Prvia1: TMenuItem
          Caption = '&Normal'
          OnClick = Prvia1Click
        end
        object mnuFolhaPreviaEspecial: TMenuItem
          Caption = '&Reserva de Poupança em Cotas'
          Visible = False
          OnClick = mnuFolhaPreviaEspecialClick
        end
        object AntecipaodeAbono2: TMenuItem
          Caption = 'Antecipação de Abono'
          Visible = False
        end
        object Adiantamento1: TMenuItem
          Caption = 'Adiantamento'
          OnClick = Adiantamento1Click
        end
        object N4: TMenuItem
          Caption = '-'
        end
        object mnuFolhaExtra: TMenuItem
          Caption = 'Folha Extra'
          OnClick = ExtraFolha1Click
        end
        object mnuPagamentosPendentes: TMenuItem
          Caption = 'Pagamentos Pendentes'
          OnClick = Restabelecimento1Click
        end
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mnuFolhaNormal: TMenuItem
        Caption = '&Definitiva'
        OnClick = mnuFolhaNormalClick
      end
      object mnuGeraArquivodeRemessa: TMenuItem
        Caption = 'Gera Arquivo de Remessa'
        OnClick = mnuGeraArquivodeRemessaClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object Estorna1: TMenuItem
        Caption = '&Estorno'
        OnClick = Estorna1Click
      end
    end
    inherited mnuCadastro: TMenuItem
      object Alimentados1: TMenuItem
        Caption = 'Alimentado'
        OnClick = Alimentados1Click
      end
      object mnuFavorecido: TMenuItem
        Caption = 'F&avorecido'
        OnClick = mnuFavorecidoClick
      end
      object ContasBancrias1: TMenuItem
        Caption = 'Contas Bancárias'
        OnClick = ContasBancrias1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object BancoXPortadorForma1: TMenuItem
        Caption = 'Banco X Contas/Caixas x Forma de Pagamento'
      end
      object mnuRubricasSalariais: TMenuItem
        Caption = '&Rubricas Salariais'
        OnClick = mnuRubricasSalariaisClick
      end
      object mnuRubricasporFundacao: TMenuItem
        Caption = 'Rubricas por F&undação'
        OnClick = mnuRubricasporFundacaoClick
      end
      object mnuRubricasporPlano: TMenuItem
        Caption = 'Rubricas por &Plano'
        OnClick = mnuRubricasporPlanoClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object RubricasIndividuais1: TMenuItem
        Caption = '&Rubricas Individuais de Beneficiários'
        OnClick = RubricasIndividuais1Click
      end
      object RubricasIncidentesnaPensoAlimentciaporBeneficirio1: TMenuItem
        Caption = 'Rubricas Incidentes na Pensão Alimentícia por Beneficiário'
      end
      object mnuCadastroManualdeRubricas: TMenuItem
        Caption = 'Cadastro Manual de Rubricas'
        OnClick = mnuCadastroManualdeRubricasClick
      end
      object mnuCadastroManualdeBeneficios: TMenuItem
        Caption = 'Cadastro Manual de Benefícios'
        OnClick = mnuCadastroManualdeBeneficiosClick
      end
      object mnuAlteraFormadePagto: TMenuItem
        Caption = 'Alteração Forma de Pagto.'
        object mnuAlteraPagamentoMensal: TMenuItem
          Caption = 'Pagamento Mensal'
        end
        object mnuAlteraPagamentoBenefcio: TMenuItem
          Caption = 'Pagamento de Benefício'
        end
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object ArquivoTXT1: TMenuItem
        Caption = 'Entidades Externas'
        object ImportaoArquivo1: TMenuItem
          Caption = 'Importação de Arquivo'
          OnClick = ImportaoArquivo1Click
        end
        object ExportaodeArquivo1: TMenuItem
          Caption = 'Exportação de Arquivo'
          OnClick = ExportaodeArquivo1Click
        end
        object LayOutDescontos1: TMenuItem
          Caption = 'Lay Out Descontos'
          OnClick = LayOutDescontos1Click
        end
      end
    end
    inherited mnuConsulta: TMenuItem
      inherited Grficos2: TMenuItem
        Visible = False
      end
      inherited Mnu_separa1_Padrao: TMenuItem
        Visible = True
      end
      inherited MnuConsPart_Padrao: TMenuItem
        Visible = True
      end
      object N2: TMenuItem [5]
        Caption = '-'
      end
      object mnuConsultaPrevia: TMenuItem
        Caption = '&Consulta a Prévia da Folha'
        OnClick = mnuConsultaPreviaClick
      end
      object mnuConsultaHistorico: TMenuItem
        Caption = 'Consulta Histórico da Folha'
        OnClick = mnuConsultaHistoricoClick
      end
      object mnuVisaoGerencialFolha: TMenuItem
        Caption = 'Visão Gerencial da Folha'
        OnClick = mnuVisaoGerencialFolhaClick
      end
      object DemenstrativodePagamento1: TMenuItem
        Caption = '&Demonstrativo de Pagamento'
        OnClick = DemenstrativodePagamento1Click
      end
    end
  end
  inherited qryFluxOper: TwwQuery
    Left = 122
    Top = 166
  end
  inherited dsFluxOper: TwwDataSource
    Left = 122
    Top = 225
  end
  inherited qryPasso: TwwQuery
    Left = 122
    Top = 49
  end
  inherited dsPasso: TwwDataSource
    Left = 122
    Top = 108
  end
  inherited IvDicionario: TIvBinaryDictionary
    Left = 27
    Top = 342
  end
  inherited CorreioCM: TCorreioCM
    Left = 27
    Top = 166
  end
  inherited QryReports: TwwQuery
    Left = 122
    Top = 342
  end
  inherited QryTemplRpt: TwwQuery
    Left = 122
    Top = 283
  end
  inherited ImlPadrao: TImageList
    Left = 27
    Top = 225
  end
  inherited AclPadrao: TActionList
    Left = 27
    Top = 283
  end
  inherited AppPadrao: TCMApplicationEvents
    Left = 27
    Top = 108
  end
  object qryParamGlobal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   USACRESPON, USAABC,CODCENTRORESPON,UNIDNEGOC'
      'FROM'
      '   PARAMGLOBAL'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP )')
    ValidateWithMask = True
    Left = 352
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryParamGlobalUSACRESPON: TStringField
      FieldName = 'USACRESPON'
      Origin = 'PARAMGLOBAL.USACRESPON'
      Size = 1
    end
    object qryParamGlobalUSAABC: TStringField
      FieldName = 'USAABC'
      Origin = 'PARAMGLOBAL.USAABC'
      Size = 1
    end
    object qryParamGlobalCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'PARAMGLOBAL.CODCENTRORESPON'
      Size = 10
    end
    object qryParamGlobalUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'PARAMGLOBAL.UNIDNEGOC'
    end
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PLANPREV.TPPLANOPREV = '#39'F'#39' '
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 217
    Top = 283
  end
end
