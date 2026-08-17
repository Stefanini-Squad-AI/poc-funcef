inherited frmCadLayoutDemoMT: TfrmCadLayoutDemoMT
  Left = 353
  Top = 228
  Caption = 'Cadastro de Layouts dos Demonstrativos de Resultados'
  ClientHeight = 402
  ClientWidth = 424
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 424
    Height = 316
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 82
      Height = 13
      Caption = 'Demonstrativo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 56
      Width = 198
      Height = 13
      Caption = 'Tipo do Demonstrativo (Relatórios)'
    end
    object Label2: TLabel
      Left = 24
      Top = 96
      Width = 93
      Height = 13
      Caption = 'Nome do Layout'
    end
    object Bevel1: TBevel
      Left = 24
      Top = 150
      Width = 377
      Height = 9
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 24
      Top = 152
      Width = 50
      Height = 13
      Caption = 'Legenda'
    end
    object dblkDemo: TwwDBLookupCombo
      Left = 24
      Top = 32
      Width = 241
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DEMDESCDEMONSTRAT'#9'60'#9'Descrição')
      DataField = 'IDDEMONSTRATIVO'
      DataSource = ds
      LookupTable = CdsDemonstrativo
      LookupField = 'IDDEMONSTRATIVO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbcboTipo: TwwDBComboBox
      Left = 24
      Top = 72
      Width = 241
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'FLGTIPOLAYOUT'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        '1 - Normal'#9'1'
        '2 - Colunado '#9'2'
        '3 - Colunado Mensal'#9'3'
        '4 - Balanço Patrimonial'#9'4')
      Sorted = False
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object dbeNome: TwwDBEdit
      Left = 24
      Top = 112
      Width = 377
      Height = 21
      DataField = 'NOMELAYOUT'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object btnDesenho: TBitBtn
      Left = 280
      Top = 32
      Width = 121
      Height = 61
      Caption = '&Desenho'
      TabOrder = 3
      OnClick = btnDesenhoClick
      Glyph.Data = {
        1E040000424D1E04000000000000760000002800000030000000270000000100
        040000000000A803000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8777777777777777888888888888888888888880000000000000000000000007
        888888888888888888888880FBFBFBFBFBFBFBFBFBFBFB078888888888888888
        88888880B0BFBFB0BFBFB0BFBFB0BF07888888888888888888888880F0FB0BF0
        FB0BF0FB0BF0FB07888888888888888888888880000000000000000000000008
        88888888888888888888888880EEEEEEEEEEEEE0788888888888888888888888
        8888888880EEEEEEEEEEEE078888888888888888888888888888888880EE0000
        0EEEE07F8F8F8F8888888888888888888888888880EE0870EEEE07F8F8F8F8F8
        88888888888888888888888880EE080EEEE0077F8F8F8F888888888888888888
        8888888880EE00EEEE0770007788888888888888888888888888888880EE0EEE
        E07887F70077888888888888888888888888888880EEEEEE078887FF77077788
        88888888888888888888888880EEEEE08888887FF70088778888888888888888
        8888888880EEEE088888887FF033087778888888888888888888888880EEE088
        88888880F003307778888888888888888888888880EE0888888888880BB03307
        78778888888888888888888880E088888888888880BB03307888888888888888
        888888888008888888888888880BB03308777777787888888888888880888888
        888888888880BB0330F888888877888888888888888888888888888888880BB0
        3308877777777788888888888888888888888888888880BB0330888777777777
        8888888888888888888888888888880BB0330888877777777888888888888888
        8888888888888880BB0330888880000008888888888888888888888888888888
        0BB03308888880008888888888888888888888888888888880BB006088888888
        88888888888888888888888888888888880B0E00088888888888888888888888
        88888888888888888880E0870088888888888888888888888888888888888888
        88880F887088888888888888888888888888888888888888888880F808888888
        8888888888888888888888888888888888888800888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888}
    end
    object memLog: TRichEdit
      Left = 24
      Top = 169
      Width = 377
      Height = 129
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'DESCRIÇÃO DAS COLUNAS DOS RELATÓRIOS'
        ''
        '********** DEMONSTRATIVO DE LAYOUT NORMAL *********'
        ''
        'SaldoRealPerEAT   - Valor Realizado no Período - Exercício Atual'
        'SaldoOrcPerEAT    - Valor Orçado no Período - Exercício Atual'
        
          'DifOrcRealPerEAT  - Diferença Orçado x Realizado no Período - Ex' +
          'ercício Atual'
        
          'AV_RealPerEAT     - Análise Vertical Valor Realizado no Período ' +
          '- Exercício Atual'
        
          'AV_OrcPerEAT      - Análise Vertical Valor Orçado no Período - E' +
          'xercício Atual'
        
          'AH_OrcRealPerEAT  - Análise Horizontal Orçado x Realizado no Per' +
          'íodo - Exercício Atual'
        'SaldoRealAcumEAT  - Valor Realizado Acumulado - Exercício Atual'
        'SaldoOrcAcumEAT   - Valor Orçado Acumulado - Exercício Atual'
        
          'DifOrcRealAcumEAT - Diferença Orçado x Realizado Acumulado - Exe' +
          'rcício Atual'
        
          'AV_RealAcumEAT    - Análise Vertical Valor Realizado Acumulado -' +
          ' Exercício Atual'
        
          'AV_OrcAcumEAT     - Análise Vertical Valor Orçado Acumulado - Ex' +
          'ercício Atual'
        
          'AH_OrcRealAcumEAT - Análise Horizontal Orçado x Realizado Acumul' +
          'ado - Exercício Atual'
        
          'SaldoRealPerEAN   - Valor Realizado no Período - Exercício Anter' +
          'ior'
        
          'DifExAtuAntPer    - Diferença Exercício Atual x Exercício Anteri' +
          'or no Período'
        
          'AV_RealPerEAN     - Análise Vertical Valor Realizado no Período ' +
          '- Exercício Anterior'
        
          'AH_ExAtuAntPer    - Análise Horizontal Exercício Atual x Exercíc' +
          'io Anterior no Período'
        
          'SaldoRealAcumEAN  - Valor Realizado Acumulado - Exercício Anteri' +
          'or'
        
          'DifExAtuAntAcum   - Diferença Exercício Atual x Exercício Anteri' +
          'or Acumulado'
        
          'AV_RealAcumEAN    - Análise Vertical Valor Realizado Acumulado -' +
          ' Exercício Anterior'
        
          'AH_ExAtuAntAcum   - Análise Horizontal Exercício Atual x Exercíc' +
          'io Anterior Acumulado'
        
          'SaldoReaPerAntEAT - Valor Realizado no Período Anterior - Exercí' +
          'cio Atual'
        
          'DifPerAtuAntEAT   - Diferença Período Atual x Período Anterior -' +
          ' Exercício Atual'
        
          'AV_RealPerAntEAT  - Análise Vertical Valor Realizado no Período ' +
          'Anterior - Exer. Atual'
        
          'AH_PerAtuAntEAT   - Análise Horizontal Período Atual x Período A' +
          'nterior - Exer. Atual'
        'SaldoIniEAT       - Saldo Inicial do Exercício Atual'
        'TotalDebPerEAT    - Total de Débito do Período - Exer. Atual'
        'TotalCrePerEAT    - Total de Crédito do Período - Exer. Atual'
        'MovPerEAT         - Movimentação do Período - Exer. Atual'
        'FlagCalcInterna   - Flag de Cálculo Interna (não usar)'
        'NomeElemento      - Nome do Elemento do Demonstrativo'
        'NomeElementoInd   - Nome do Elemento do Demonstrativo Indentado'
        'OrdemElemento     - Ordem do Elemento do Demonstrativo'
        
          'CodigoElemento    - Código Interno do Elemento do Demonstrativo ' +
          '(não usar)'
        'Codigo            - Código do Elemento do Demonstrativo'
        
          'TipoElemento      - Tipo do Elemento do Demonstrativo (Conta, So' +
          'matório, Título)'
        'NaturezaElemento  - Natureza do Elemento do Demonstrativo'
        
          'Indentacao        - Indentação dos Elementos do Demonstrativo (n' +
          'ão usar)'
        'FlagMonetaria     - Tipo Monetário do Elemento (não usar)'
        'SaltaPag          - Flag indicativa de salto de página'
        'Linha1            - Flag indicativa de Espaço entre os elementos'
        
          'Linha2            - Flag indicativa de Linha Fina entre os eleme' +
          'ntos'
        
          'Linha3            - Flag indicativa de Linha Grossa entre os ele' +
          'mentos'
        'PeriodoIni        - Período inicial dos Parâmetros do Relatório'
        'PeriodoFim        - Período final dos Parâmetros do Relatório'
        'Exercicio         - Exercício dos Parâmetros do Relatório'
        'CCusto            - Centro de Custo dos Parâmetros do Relatório'
        
          'AtivProj          - Atividade/Projeto dos Parâmetros do Relatóri' +
          'o'
        
          'SaldRealPerEATS  - Valor Realizado no Período - Exercício Atual ' +
          '- SEM O CONTROLE DE SINAL OU NATUREZA'
        
          'SaldOrcPerEATS   - Valor Orçado no Período - Exercício Atual - S' +
          'EM O CONTROLE DE SINAL OU NATUREZA'
        
          'SaldRealAcumEATS - Valor Realizado Acumulado - Exercício Atual -' +
          ' SEM O CONTROLE DE SINAL OU NATUREZA'
        
          'SaldOrcAcumEATS  - Valor Orçado Acumulado - Exercício Atual - SE' +
          'M O CONTROLE DE SINAL OU NATUREZA'
        
          'SaldRealPerEANS  - Valor Realizado no Período - Exercício Anteri' +
          'or - SEM O CONTROLE DE SINAL OU NATUREZA'
        
          'SaldRealAcumEANS - Valor Realizado Acumulado - Exercício Anterio' +
          'r - SEM O CONTROLE DE SINAL OU NATUREZA'
        
          'SaldReaPerAntEATS- Valor Realizado no Período Anterior - Exercíc' +
          'io Atual - SEM O CONTROLE DE SINAL OU NATUREZA'
        'Plano                         - Nome do Plano Previdenciário'
        'PAtro                         - Patrocinadora'
        ''
        ''
        '********** DEMONSTRATIVO DE LAYOUT COLUNADO **********'
        ''
        'Coluna1 a 12          - Colunas do Demonstrativo'
        
          'PercEntrePrim_Ult     - Percentual entre a Primeira e Última Col' +
          'una'
        'SomatorioLinha        - Somatório da Linha'
        'FlagCalcInterna1 a 12 - Flag de Cálculo Interna (não usar)'
        'NomeLinha             - Nome da Linha'
        'CodigoLinha           - Código Interno da Linha (não usar)'
        'OrdemLinha            - Ordem da Linha'
        'NaturezaLinha         - Natureza da Linha'
        'FlagMonetaria         - Tipo Monetário da Linha (não usar)'
        
          'PeriodoIni            - Período inicial dos Parâmetros do Relató' +
          'rio'
        
          'PeriodoFim            - Período final dos Parâmetros do Relatóri' +
          'o'
        'Exercicio             - Exercício dos Parâmetros do Relatório'
        
          'CCusto                - Centro de Custo dos Parâmetros do Relató' +
          'rio'
        
          'AtivProj              - Atividade/Projeto dos Parâmetros do Rela' +
          'tório'
        'Plano                 - Nome do Plano Previdenciário'
        'PAtro                 - Patrocinadora'
        ''
        ''
        '********** DEMONSTRATIVO DE LAYOUT COLUNADO MENSAL **********'
        ''
        'M01_Janeiro        - Valor do mês de Janeiro'
        'M02_Fevereiro      - Valor do mês de Fevereiro'
        'M03_Marco          - Valor do mês de Março'
        'M04_Abril          - Valor do mês de Abril'
        'M05_Maio           - Valor do mês de Maio'
        'M06_Junho          - Valor do mês de Junho'
        'M07_Julho          - Valor do mês de Julho'
        'M08_Agosto         - Valor do mês de Agosto'
        'M09_Setembro       - Valor do mês de Setembro'
        'M10_Outubro        - Valor do mês de Outubro'
        'M11_Novembro       - Valor do mês de Novembro'
        'M12_Dezembro       - Valor do mês de Dezembro'
        'SomatorioLinha     - Somatório da Linha'
        'O01_Janeiro        - Valor Orçado do mês de Janeiro'
        'O02_Fevereiro      - Valor Orçado do mês de Fevereiro'
        'O03_Marco          - Valor Orçado do mês de Março'
        'O04_Abril          - Valor Orçado do mês de Abril'
        'O05_Maio           - Valor Orçado do mês de Maio'
        'O06_Junho          - Valor Orçado do mês de Junho'
        'O07_Julho          - Valor Orçado do mês de Julho'
        'O08_Agosto         - Valor Orçado do mês de Agosto'
        'O09_Setembro       - Valor Orçado do mês de Setembro'
        'O10_Outubro        - Valor Orçado do mês de Outubro'
        'O11_Novembro       - Valor Orçado do mês de Novembro'
        'O12_Dezembro       - Valor Orçado do mês de Dezembro'
        'SomatLinhaOrc      - Somatório da Linha do Orçado'
        'FlagCalcInterna    - Flag de Cálculo Interna (não usar)'
        'NomeElemento       - Nome do Elemento do Demonstrativo'
        'NomeElementoInd    - Nome do Elemento do Demonstrativo Indentado'
        'OrdemElemento      - Ordem do Elemento do Demonstrativo'
        
          'CodigoElemento     - Código Interno do Elemento do Demonstrativo' +
          ' (não usar)'
        'Codigo             - Código do Elemento do Demonstrativo'
        
          'TipoElemento       - Tipo do Elemento do Demonstrativo (Conta, S' +
          'omatório, Título)'
        'NaturezaElemento   - Natureza do Elemento do Demonstrativo'
        
          'Indentacao         - Indentação dos Elementos do Demonstrativo (' +
          'não usar)'
        'FlagMonetaria      - Tipo Monetário do Elemento (não usar)'
        'SaltaPag           - Flag indicativa de salto de página'
        
          'Linha1             - Flag indicativa de Espaço entre os elemento' +
          's'
        
          'Linha2             - Flag indicativa de Linha Fina entre os elem' +
          'entos'
        
          'Linha3             - Flag indicativa de Linha Grossa entre os el' +
          'ementos'
        'PeriodoIni         - Período inicial dos Parâmetros do Relatório'
        'PeriodoFim         - Período final dos Parâmetros do Relatório'
        'Exercicio          - Exercício dos Parâmetros do Relatório'
        'CCusto             - Centro de Custo dos Parâmetros do Relatório'
        
          'AtivProj           - Atividade/Projeto dos Parâmetros do Relatór' +
          'io'
        
          'M01_JaneiroS       - Valor do mês de Janeiro - SEM O CONTROLE DE' +
          ' SINAL OU NATUREZA'
        
          'M02_FevereiroS     - Valor do mês de Fevereiro - SEM O CONTROLE ' +
          'DE SINAL OU NATUREZA'
        
          'M03_MarcoS         - Valor do mês de Março - SEM O CONTROLE DE S' +
          'INAL OU NATUREZA'
        
          'M04_AbrilS         - Valor do mês de Abril - SEM O CONTROLE DE S' +
          'INAL OU NATUREZA'
        
          'M05_MaioS          - Valor do mês de Maio - SEM O CONTROLE DE SI' +
          'NAL OU NATUREZA'
        
          'M06_JunhoS         - Valor do mês de Junho - SEM O CONTROLE DE S' +
          'INAL OU NATUREZA'
        
          'M07_JulhoS         - Valor do mês de Julho - SEM O CONTROLE DE S' +
          'INAL OU NATUREZA'
        
          'M08_AgostoS        - Valor do mês de Agosto - SEM O CONTROLE DE ' +
          'SINAL OU NATUREZA'
        
          'M09_SetembroS      - Valor do mês de Setembro - SEM O CONTROLE D' +
          'E SINAL OU NATUREZA'
        
          'M10_OutubroS       - Valor do mês de Outubro - SEM O CONTROLE DE' +
          ' SINAL OU NATUREZA'
        
          'M11_NovembroS      - Valor do mês de Novembro - SEM O CONTROLE D' +
          'E SINAL OU NATUREZA'
        
          'M12_DezembroS      - Valor do mês de Dezembro - SEM O CONTROLE D' +
          'E SINAL OU NATUREZA'
        
          'O01_JaneiroS       - Valor Orçado do mês de Janeiro - SEM O CONT' +
          'ROLE DE SINAL OU NATUREZA'
        
          'O02_FevereiroS     - Valor Orçado do mês de Fevereiro - SEM O CO' +
          'NTROLE DE SINAL OU NATUREZA'
        
          'O03_MarcoS         - Valor Orçado do mês de Março - SEM O CONTRO' +
          'LE DE SINAL OU NATUREZA'
        
          'O04_AbrilS         - Valor Orçado do mês de Abril - SEM O CONTRO' +
          'LE DE SINAL OU NATUREZA'
        
          'O05_MaioS          - Valor Orçado do mês de Maio - SEM O CONTROL' +
          'E DE SINAL OU NATUREZA'
        
          'O06_JunhoS         - Valor Orçado do mês de Junho - SEM O CONTRO' +
          'LE DE SINAL OU NATUREZA'
        
          'O07_JulhoS         - Valor Orçado do mês de Julho - SEM O CONTRO' +
          'LE DE SINAL OU NATUREZA'
        
          'O08_AgostoS        - Valor Orçado do mês de Agosto - SEM O CONTR' +
          'OLE DE SINAL OU NATUREZA'
        
          'O09_SetembroS      - Valor Orçado do mês de Setembro - SEM O CON' +
          'TROLE DE SINAL OU NATUREZA'
        
          'O10_OutubroS       - Valor Orçado do mês de Outubro - SEM O CONT' +
          'ROLE DE SINAL OU NATUREZA'
        
          'O11_NovembroS      - Valor Orçado do mês de Novembro - SEM O CON' +
          'TROLE DE SINAL OU NATUREZA'
        
          'O12_DezembroS      - Valor Orçado do mês de Dezembro - SEM O CON' +
          'TROLE DE SINAL OU NATUREZA'
        'Plano                         - Nome do Plano Previdenciário'
        'PAtro                         - Patrocinadora'
        ''
        
          '********** DEMONSTRATIVO DE LAYOUT BALANÇO PATRIMONIAL *********' +
          '*'
        ''
        'Pos01Col1Valor     - Valor da Posição 01 / Coluna 1'
        'Pos02Col1Valor     - Valor da Posição 02 / Coluna 1'
        'Pos03Col1Valor     - Valor da Posição 03 / Coluna 1'
        '     ...                       ...'
        'Pos30Col1Valor     - Valor da Posição 40 / Coluna 1'
        ''
        'Pos01Col2Valor     - Valor da Posição 01 / Coluna 2'
        'Pos02Col2Valor     - Valor da Posição 02 / Coluna 2'
        'Pos03Col2Valor     - Valor da Posição 03 / Coluna 2'
        '     ...                       ...'
        'Pos30Col2Valor     - Valor da Posição 40 / Coluna 2'
        ''
        
          'Pos01Col1SalEANT   - Valor do Saldo Anterior da Posição 01 / Col' +
          'una 1'
        
          'Pos02Col1SalEANT   - Valor do Saldo Anterior da Posição 02 / Col' +
          'una 1'
        
          'Pos03Col1SalEANT   - Valor do Saldo Anterior da Posição 03 / Col' +
          'una 1'
        '     ...                       ...'
        
          'Pos30Col1SalEANT   - Valor do Saldo Anterior da Posição 40 / Col' +
          'una 1'
        ''
        
          'Pos01Col2SalEANT   - Valor do Saldo Anterior da Posição 01 / Col' +
          'una 2'
        
          'Pos02Col2SalEANT   - Valor do Saldo Anterior da Posição 02 / Col' +
          'una 2'
        
          'Pos03Col2SalEANT   - Valor do Saldo Anterior da Posição 03 / Col' +
          'una 2'
        '     ...                       ...'
        
          'Pos30Col2SalEANT   - Valor do Saldo Anterior da Posição 40 / Col' +
          'una 2'
        ''
        'Pos01Col1Descr     - Descrição da Posição 01 / Coluna 1'
        'Pos02Col1Descr     - Descrição da Posição 02 / Coluna 1'
        'Pos03Col1Descr     - Descrição da Posição 03 / Coluna 1'
        '     ...                       ...'
        'Pos30Col1Descr     - Descrição da Posição 40 / Coluna 1'
        ''
        'Pos01Col2Descr     - Descrição da Posição 01 / Coluna 2'
        'Pos02Col2Descr     - Descrição da Posição 02 / Coluna 2'
        'Pos03Col2Descr     - Descrição da Posição 03 / Coluna 2'
        '     ...                       ...'
        'Pos30Col2Descr     - Descrição da Posição 40 / Coluna 2'
        ''
        'PeriodoIni         - Período inicial dos Parâmetros do Relatório'
        'PeriodoFim         - Período final dos Parâmetros do Relatório'
        'Exercicio          - Exercício dos Parâmetros do Relatório'
        'CCusto             - Centro de Custo dos Parâmetros do Relatório'
        
          'AtivProj           - Atividade/Projeto dos Parâmetros do Relatór' +
          'io'
        'Plano              - Nome do Plano Previdenciário'
        'PAtro              - Patrocinadora'
        ''
        '')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 4
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 424
  end
  inherited Dock971: TDock97
    Top = 363
    Width = 424
    inherited tb97Fundo: TToolbar97
      Left = 252
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 10
    Top = 367
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Top = 183
  end
  inherited ImlPadrao: TImageList
    Left = 48
    Top = 367
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 288
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 236
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DEMONSTRATIVO.DEMDESCDEMONSTRAT'
      'DESENHODEMO.NOMELAYOUT')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Demonstrativo'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'DEMONSTRATIVO'
      'DESENHODEMO')
    CamposChave.Strings = (
      'DESENHODEMO.IDDESENHODEMO')
    Filtro.Strings = (
      'DEMONSTRATIVO.IDDEMONSTRATIVO = DESENHODEMO.IDDEMONSTRATIVO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '40')
    Left = 376
    Top = 65535
  end
  object RptCM: TppReport
    AutoStop = False
    DataPipeline = ppConsulta
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 301
    Top = 228
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppConsulta'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppRelatorio: TppBDEPipeline
    DataSource = ds
    UserName = 'Relatorio'
    Left = 248
    Top = 232
    object ppRelatorioppField1: TppField
      FieldAlias = 'IDDESENHODEMO'
      FieldName = 'IDDESENHODEMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppRelatorioppField2: TppField
      FieldAlias = 'IDDEMONSTRATIVO'
      FieldName = 'IDDEMONSTRATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppRelatorioppField3: TppField
      FieldAlias = 'IDREPORTS'
      FieldName = 'IDREPORTS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppRelatorioppField4: TppField
      FieldAlias = 'ORIGEMCM'
      FieldName = 'ORIGEMCM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppRelatorioppField5: TppField
      FieldAlias = 'FLGTIPOLAYOUT'
      FieldName = 'FLGTIPOLAYOUT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppRelatorioppField6: TppField
      FieldAlias = 'NOMELAYOUT'
      FieldName = 'NOMELAYOUT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerador de Relatórios e Gráficos'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    Report = RptCM
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 344
    Top = 224
  end
  object pplDemoColMes: TppBDEPipeline
    DataSource = dsDemoColMes
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Consulta3'
    Left = 327
    Top = 180
  end
  object pplDemoBalPatr: TppBDEPipeline
    DataSource = dsDemoBalPatr
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Consulta2'
    Left = 246
    Top = 180
    object pplDemoBalPatrppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS01COL1VALOR'
      FieldName = 'POS01COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplDemoBalPatrppField2: TppField
      FieldAlias = 'POS01COL1DESCR'
      FieldName = 'POS01COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object pplDemoBalPatrppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS02COL1VALOR'
      FieldName = 'POS02COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplDemoBalPatrppField4: TppField
      FieldAlias = 'POS02COL1DESCR'
      FieldName = 'POS02COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object pplDemoBalPatrppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS03COL1VALOR'
      FieldName = 'POS03COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplDemoBalPatrppField6: TppField
      FieldAlias = 'POS03COL1DESCR'
      FieldName = 'POS03COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object pplDemoBalPatrppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS04COL1VALOR'
      FieldName = 'POS04COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplDemoBalPatrppField8: TppField
      FieldAlias = 'POS04COL1DESCR'
      FieldName = 'POS04COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object pplDemoBalPatrppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS05COL1VALOR'
      FieldName = 'POS05COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplDemoBalPatrppField10: TppField
      FieldAlias = 'POS05COL1DESCR'
      FieldName = 'POS05COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 9
    end
    object pplDemoBalPatrppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS06COL1VALOR'
      FieldName = 'POS06COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplDemoBalPatrppField12: TppField
      FieldAlias = 'POS06COL1DESCR'
      FieldName = 'POS06COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object pplDemoBalPatrppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS07COL1VALOR'
      FieldName = 'POS07COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplDemoBalPatrppField14: TppField
      FieldAlias = 'POS07COL1DESCR'
      FieldName = 'POS07COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object pplDemoBalPatrppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS08COL1VALOR'
      FieldName = 'POS08COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplDemoBalPatrppField16: TppField
      FieldAlias = 'POS08COL1DESCR'
      FieldName = 'POS08COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 15
    end
    object pplDemoBalPatrppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS09COL1VALOR'
      FieldName = 'POS09COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplDemoBalPatrppField18: TppField
      FieldAlias = 'POS09COL1DESCR'
      FieldName = 'POS09COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 17
    end
    object pplDemoBalPatrppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS10COL1VALOR'
      FieldName = 'POS10COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplDemoBalPatrppField20: TppField
      FieldAlias = 'POS10COL1DESCR'
      FieldName = 'POS10COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 19
    end
    object pplDemoBalPatrppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS11COL1VALOR'
      FieldName = 'POS11COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplDemoBalPatrppField22: TppField
      FieldAlias = 'POS11COL1DESCR'
      FieldName = 'POS11COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 21
    end
    object pplDemoBalPatrppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS12COL1VALOR'
      FieldName = 'POS12COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplDemoBalPatrppField24: TppField
      FieldAlias = 'POS12COL1DESCR'
      FieldName = 'POS12COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 23
    end
    object pplDemoBalPatrppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS13COL1VALOR'
      FieldName = 'POS13COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplDemoBalPatrppField26: TppField
      FieldAlias = 'POS13COL1DESCR'
      FieldName = 'POS13COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 25
    end
    object pplDemoBalPatrppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS14COL1VALOR'
      FieldName = 'POS14COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplDemoBalPatrppField28: TppField
      FieldAlias = 'POS14COL1DESCR'
      FieldName = 'POS14COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 27
    end
    object pplDemoBalPatrppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS15COL1VALOR'
      FieldName = 'POS15COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplDemoBalPatrppField30: TppField
      FieldAlias = 'POS15COL1DESCR'
      FieldName = 'POS15COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 29
    end
    object pplDemoBalPatrppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS16COL1VALOR'
      FieldName = 'POS16COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplDemoBalPatrppField32: TppField
      FieldAlias = 'POS16COL1DESCR'
      FieldName = 'POS16COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 31
    end
    object pplDemoBalPatrppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS17COL1VALOR'
      FieldName = 'POS17COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplDemoBalPatrppField34: TppField
      FieldAlias = 'POS17COL1DESCR'
      FieldName = 'POS17COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 33
    end
    object pplDemoBalPatrppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS18COL1VALOR'
      FieldName = 'POS18COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplDemoBalPatrppField36: TppField
      FieldAlias = 'POS18COL1DESCR'
      FieldName = 'POS18COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 35
    end
    object pplDemoBalPatrppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS19COL1VALOR'
      FieldName = 'POS19COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object pplDemoBalPatrppField38: TppField
      FieldAlias = 'POS19COL1DESCR'
      FieldName = 'POS19COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 37
    end
    object pplDemoBalPatrppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS20COL1VALOR'
      FieldName = 'POS20COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object pplDemoBalPatrppField40: TppField
      FieldAlias = 'POS20COL1DESCR'
      FieldName = 'POS20COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 39
    end
    object pplDemoBalPatrppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS21COL1VALOR'
      FieldName = 'POS21COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object pplDemoBalPatrppField42: TppField
      FieldAlias = 'POS21COL1DESCR'
      FieldName = 'POS21COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 41
    end
    object pplDemoBalPatrppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS22COL1VALOR'
      FieldName = 'POS22COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object pplDemoBalPatrppField44: TppField
      FieldAlias = 'POS22COL1DESCR'
      FieldName = 'POS22COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 43
    end
    object pplDemoBalPatrppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS23COL1VALOR'
      FieldName = 'POS23COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object pplDemoBalPatrppField46: TppField
      FieldAlias = 'POS23COL1DESCR'
      FieldName = 'POS23COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 45
    end
    object pplDemoBalPatrppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS24COL1VALOR'
      FieldName = 'POS24COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object pplDemoBalPatrppField48: TppField
      FieldAlias = 'POS24COL1DESCR'
      FieldName = 'POS24COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 47
    end
    object pplDemoBalPatrppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS25COL1VALOR'
      FieldName = 'POS25COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object pplDemoBalPatrppField50: TppField
      FieldAlias = 'POS25COL1DESCR'
      FieldName = 'POS25COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 49
    end
    object pplDemoBalPatrppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS26COL1VALOR'
      FieldName = 'POS26COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object pplDemoBalPatrppField52: TppField
      FieldAlias = 'POS26COL1DESCR'
      FieldName = 'POS26COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 51
    end
    object pplDemoBalPatrppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS27COL1VALOR'
      FieldName = 'POS27COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object pplDemoBalPatrppField54: TppField
      FieldAlias = 'POS27COL1DESCR'
      FieldName = 'POS27COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 53
    end
    object pplDemoBalPatrppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS28COL1VALOR'
      FieldName = 'POS28COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object pplDemoBalPatrppField56: TppField
      FieldAlias = 'POS28COL1DESCR'
      FieldName = 'POS28COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 55
    end
    object pplDemoBalPatrppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS29COL1VALOR'
      FieldName = 'POS29COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object pplDemoBalPatrppField58: TppField
      FieldAlias = 'POS29COL1DESCR'
      FieldName = 'POS29COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 57
    end
    object pplDemoBalPatrppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS30COL1VALOR'
      FieldName = 'POS30COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object pplDemoBalPatrppField60: TppField
      FieldAlias = 'POS30COL1DESCR'
      FieldName = 'POS30COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 59
    end
    object pplDemoBalPatrppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS01COL2VALOR'
      FieldName = 'POS01COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object pplDemoBalPatrppField62: TppField
      FieldAlias = 'POS01COL2DESCR'
      FieldName = 'POS01COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 61
    end
    object pplDemoBalPatrppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS02COL2VALOR'
      FieldName = 'POS02COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object pplDemoBalPatrppField64: TppField
      FieldAlias = 'POS02COL2DESCR'
      FieldName = 'POS02COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 63
    end
    object pplDemoBalPatrppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS03COL2VALOR'
      FieldName = 'POS03COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object pplDemoBalPatrppField66: TppField
      FieldAlias = 'POS03COL2DESCR'
      FieldName = 'POS03COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 65
    end
    object pplDemoBalPatrppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS04COL2VALOR'
      FieldName = 'POS04COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object pplDemoBalPatrppField68: TppField
      FieldAlias = 'POS04COL2DESCR'
      FieldName = 'POS04COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 67
    end
    object pplDemoBalPatrppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS05COL2VALOR'
      FieldName = 'POS05COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object pplDemoBalPatrppField70: TppField
      FieldAlias = 'POS05COL2DESCR'
      FieldName = 'POS05COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 69
    end
    object pplDemoBalPatrppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS06COL2VALOR'
      FieldName = 'POS06COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 70
    end
    object pplDemoBalPatrppField72: TppField
      FieldAlias = 'POS06COL2DESCR'
      FieldName = 'POS06COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 71
    end
    object pplDemoBalPatrppField73: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS07COL2VALOR'
      FieldName = 'POS07COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 72
    end
    object pplDemoBalPatrppField74: TppField
      FieldAlias = 'POS07COL2DESCR'
      FieldName = 'POS07COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 73
    end
    object pplDemoBalPatrppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS08COL2VALOR'
      FieldName = 'POS08COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object pplDemoBalPatrppField76: TppField
      FieldAlias = 'POS08COL2DESCR'
      FieldName = 'POS08COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 75
    end
    object pplDemoBalPatrppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS09COL2VALOR'
      FieldName = 'POS09COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 76
    end
    object pplDemoBalPatrppField78: TppField
      FieldAlias = 'POS09COL2DESCR'
      FieldName = 'POS09COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 77
    end
    object pplDemoBalPatrppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS10COL2VALOR'
      FieldName = 'POS10COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 78
    end
    object pplDemoBalPatrppField80: TppField
      FieldAlias = 'POS10COL2DESCR'
      FieldName = 'POS10COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 79
    end
    object pplDemoBalPatrppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS11COL2VALOR'
      FieldName = 'POS11COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 80
    end
    object pplDemoBalPatrppField82: TppField
      FieldAlias = 'POS11COL2DESCR'
      FieldName = 'POS11COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 81
    end
    object pplDemoBalPatrppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS12COL2VALOR'
      FieldName = 'POS12COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 82
    end
    object pplDemoBalPatrppField84: TppField
      FieldAlias = 'POS12COL2DESCR'
      FieldName = 'POS12COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 83
    end
    object pplDemoBalPatrppField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS13COL2VALOR'
      FieldName = 'POS13COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 84
    end
    object pplDemoBalPatrppField86: TppField
      FieldAlias = 'POS13COL2DESCR'
      FieldName = 'POS13COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 85
    end
    object pplDemoBalPatrppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS14COL2VALOR'
      FieldName = 'POS14COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 86
    end
    object pplDemoBalPatrppField88: TppField
      FieldAlias = 'POS14COL2DESCR'
      FieldName = 'POS14COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 87
    end
    object pplDemoBalPatrppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS15COL2VALOR'
      FieldName = 'POS15COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 88
    end
    object pplDemoBalPatrppField90: TppField
      FieldAlias = 'POS15COL2DESCR'
      FieldName = 'POS15COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 89
    end
    object pplDemoBalPatrppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS16COL2VALOR'
      FieldName = 'POS16COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 90
    end
    object pplDemoBalPatrppField92: TppField
      FieldAlias = 'POS16COL2DESCR'
      FieldName = 'POS16COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 91
    end
    object pplDemoBalPatrppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS17COL2VALOR'
      FieldName = 'POS17COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 92
    end
    object pplDemoBalPatrppField94: TppField
      FieldAlias = 'POS17COL2DESCR'
      FieldName = 'POS17COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 93
    end
    object pplDemoBalPatrppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS18COL2VALOR'
      FieldName = 'POS18COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 94
    end
    object pplDemoBalPatrppField96: TppField
      FieldAlias = 'POS18COL2DESCR'
      FieldName = 'POS18COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 95
    end
    object pplDemoBalPatrppField97: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS19COL2VALOR'
      FieldName = 'POS19COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 96
    end
    object pplDemoBalPatrppField98: TppField
      FieldAlias = 'POS19COL2DESCR'
      FieldName = 'POS19COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 97
    end
    object pplDemoBalPatrppField99: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS20COL2VALOR'
      FieldName = 'POS20COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 98
    end
    object pplDemoBalPatrppField100: TppField
      FieldAlias = 'POS20COL2DESCR'
      FieldName = 'POS20COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 99
    end
    object pplDemoBalPatrppField101: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS21COL2VALOR'
      FieldName = 'POS21COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 100
    end
    object pplDemoBalPatrppField102: TppField
      FieldAlias = 'POS21COL2DESCR'
      FieldName = 'POS21COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 101
    end
    object pplDemoBalPatrppField103: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS22COL2VALOR'
      FieldName = 'POS22COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 102
    end
    object pplDemoBalPatrppField104: TppField
      FieldAlias = 'POS22COL2DESCR'
      FieldName = 'POS22COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 103
    end
    object pplDemoBalPatrppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS23COL2VALOR'
      FieldName = 'POS23COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 104
    end
    object pplDemoBalPatrppField106: TppField
      FieldAlias = 'POS23COL2DESCR'
      FieldName = 'POS23COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 105
    end
    object pplDemoBalPatrppField107: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS24COL2VALOR'
      FieldName = 'POS24COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 106
    end
    object pplDemoBalPatrppField108: TppField
      FieldAlias = 'POS24COL2DESCR'
      FieldName = 'POS24COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 107
    end
    object pplDemoBalPatrppField109: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS25COL2VALOR'
      FieldName = 'POS25COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 108
    end
    object pplDemoBalPatrppField110: TppField
      FieldAlias = 'POS25COL2DESCR'
      FieldName = 'POS25COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 109
    end
    object pplDemoBalPatrppField111: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS26COL2VALOR'
      FieldName = 'POS26COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 110
    end
    object pplDemoBalPatrppField112: TppField
      FieldAlias = 'POS26COL2DESCR'
      FieldName = 'POS26COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 111
    end
    object pplDemoBalPatrppField113: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS27COL2VALOR'
      FieldName = 'POS27COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 112
    end
    object pplDemoBalPatrppField114: TppField
      FieldAlias = 'POS27COL2DESCR'
      FieldName = 'POS27COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 113
    end
    object pplDemoBalPatrppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS28COL2VALOR'
      FieldName = 'POS28COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 114
    end
    object pplDemoBalPatrppField116: TppField
      FieldAlias = 'POS28COL2DESCR'
      FieldName = 'POS28COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 115
    end
    object pplDemoBalPatrppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS29COL2VALOR'
      FieldName = 'POS29COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 116
    end
    object pplDemoBalPatrppField118: TppField
      FieldAlias = 'POS29COL2DESCR'
      FieldName = 'POS29COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 117
    end
    object pplDemoBalPatrppField119: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS30COL2VALOR'
      FieldName = 'POS30COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 118
    end
    object pplDemoBalPatrppField120: TppField
      FieldAlias = 'POS30COL2DESCR'
      FieldName = 'POS30COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 119
    end
    object pplDemoBalPatrppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS31COL1VALOR'
      FieldName = 'POS31COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 120
    end
    object pplDemoBalPatrppField122: TppField
      FieldAlias = 'POS31COL1DESCR'
      FieldName = 'POS31COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 121
    end
    object pplDemoBalPatrppField123: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS32COL1VALOR'
      FieldName = 'POS32COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 122
    end
    object pplDemoBalPatrppField124: TppField
      FieldAlias = 'POS32COL1DESCR'
      FieldName = 'POS32COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 123
    end
    object pplDemoBalPatrppField125: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS33COL1VALOR'
      FieldName = 'POS33COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 124
    end
    object pplDemoBalPatrppField126: TppField
      FieldAlias = 'POS33COL1DESCR'
      FieldName = 'POS33COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 125
    end
    object pplDemoBalPatrppField127: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS34COL1VALOR'
      FieldName = 'POS34COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 126
    end
    object pplDemoBalPatrppField128: TppField
      FieldAlias = 'POS34COL1DESCR'
      FieldName = 'POS34COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 127
    end
    object pplDemoBalPatrppField129: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS35COL1VALOR'
      FieldName = 'POS35COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 128
    end
    object pplDemoBalPatrppField130: TppField
      FieldAlias = 'POS35COL1DESCR'
      FieldName = 'POS35COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 129
    end
    object pplDemoBalPatrppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS36COL1VALOR'
      FieldName = 'POS36COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 130
    end
    object pplDemoBalPatrppField132: TppField
      FieldAlias = 'POS36COL1DESCR'
      FieldName = 'POS36COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 131
    end
    object pplDemoBalPatrppField133: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS37COL1VALOR'
      FieldName = 'POS37COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 132
    end
    object pplDemoBalPatrppField134: TppField
      FieldAlias = 'POS37COL1DESCR'
      FieldName = 'POS37COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 133
    end
    object pplDemoBalPatrppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS38COL1VALOR'
      FieldName = 'POS38COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 134
    end
    object pplDemoBalPatrppField136: TppField
      FieldAlias = 'POS38COL1DESCR'
      FieldName = 'POS38COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 135
    end
    object pplDemoBalPatrppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS39COL1VALOR'
      FieldName = 'POS39COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 136
    end
    object pplDemoBalPatrppField138: TppField
      FieldAlias = 'POS39COL1DESCR'
      FieldName = 'POS39COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 137
    end
    object pplDemoBalPatrppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS40COL1VALOR'
      FieldName = 'POS40COL1VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 138
    end
    object pplDemoBalPatrppField140: TppField
      FieldAlias = 'POS40COL1DESCR'
      FieldName = 'POS40COL1DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 139
    end
    object pplDemoBalPatrppField141: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS31COL2VALOR'
      FieldName = 'POS31COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 140
    end
    object pplDemoBalPatrppField142: TppField
      FieldAlias = 'POS31COL2DESCR'
      FieldName = 'POS31COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 141
    end
    object pplDemoBalPatrppField143: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS32COL2VALOR'
      FieldName = 'POS32COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 142
    end
    object pplDemoBalPatrppField144: TppField
      FieldAlias = 'POS32COL2DESCR'
      FieldName = 'POS32COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 143
    end
    object pplDemoBalPatrppField145: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS33COL2VALOR'
      FieldName = 'POS33COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 144
    end
    object pplDemoBalPatrppField146: TppField
      FieldAlias = 'POS33COL2DESCR'
      FieldName = 'POS33COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 145
    end
    object pplDemoBalPatrppField147: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS34COL2VALOR'
      FieldName = 'POS34COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 146
    end
    object pplDemoBalPatrppField148: TppField
      FieldAlias = 'POS34COL2DESCR'
      FieldName = 'POS34COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 147
    end
    object pplDemoBalPatrppField149: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS35COL2VALOR'
      FieldName = 'POS35COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 148
    end
    object pplDemoBalPatrppField150: TppField
      FieldAlias = 'POS35COL2DESCR'
      FieldName = 'POS35COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 149
    end
    object pplDemoBalPatrppField151: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS36COL2VALOR'
      FieldName = 'POS36COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 150
    end
    object pplDemoBalPatrppField152: TppField
      FieldAlias = 'POS36COL2DESCR'
      FieldName = 'POS36COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 151
    end
    object pplDemoBalPatrppField153: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS37COL2VALOR'
      FieldName = 'POS37COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 152
    end
    object pplDemoBalPatrppField154: TppField
      FieldAlias = 'POS37COL2DESCR'
      FieldName = 'POS37COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 153
    end
    object pplDemoBalPatrppField155: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS38COL2VALOR'
      FieldName = 'POS38COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 154
    end
    object pplDemoBalPatrppField156: TppField
      FieldAlias = 'POS38COL2DESCR'
      FieldName = 'POS38COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 155
    end
    object pplDemoBalPatrppField157: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS39COL2VALOR'
      FieldName = 'POS39COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 156
    end
    object pplDemoBalPatrppField158: TppField
      FieldAlias = 'POS39COL2DESCR'
      FieldName = 'POS39COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 157
    end
    object pplDemoBalPatrppField159: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS40COL2VALOR'
      FieldName = 'POS40COL2VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 158
    end
    object pplDemoBalPatrppField160: TppField
      FieldAlias = 'POS40COL2DESCR'
      FieldName = 'POS40COL2DESCR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 159
    end
    object pplDemoBalPatrppField161: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS01COL1SALEANT'
      FieldName = 'POS01COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 160
    end
    object pplDemoBalPatrppField162: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS02COL1SALEANT'
      FieldName = 'POS02COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 161
    end
    object pplDemoBalPatrppField163: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS03COL1SALEANT'
      FieldName = 'POS03COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 162
    end
    object pplDemoBalPatrppField164: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS04COL1SALEANT'
      FieldName = 'POS04COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 163
    end
    object pplDemoBalPatrppField165: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS05COL1SALEANT'
      FieldName = 'POS05COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 164
    end
    object pplDemoBalPatrppField166: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS06COL1SALEANT'
      FieldName = 'POS06COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 165
    end
    object pplDemoBalPatrppField167: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS07COL1SALEANT'
      FieldName = 'POS07COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 166
    end
    object pplDemoBalPatrppField168: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS08COL1SALEANT'
      FieldName = 'POS08COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 167
    end
    object pplDemoBalPatrppField169: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS09COL1SALEANT'
      FieldName = 'POS09COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 168
    end
    object pplDemoBalPatrppField170: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS10COL1SALEANT'
      FieldName = 'POS10COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 169
    end
    object pplDemoBalPatrppField171: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS11COL1SALEANT'
      FieldName = 'POS11COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 170
    end
    object pplDemoBalPatrppField172: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS12COL1SALEANT'
      FieldName = 'POS12COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 171
    end
    object pplDemoBalPatrppField173: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS13COL1SALEANT'
      FieldName = 'POS13COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 172
    end
    object pplDemoBalPatrppField174: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS14COL1SALEANT'
      FieldName = 'POS14COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 173
    end
    object pplDemoBalPatrppField175: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS15COL1SALEANT'
      FieldName = 'POS15COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 174
    end
    object pplDemoBalPatrppField176: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS16COL1SALEANT'
      FieldName = 'POS16COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 175
    end
    object pplDemoBalPatrppField177: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS17COL1SALEANT'
      FieldName = 'POS17COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 176
    end
    object pplDemoBalPatrppField178: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS18COL1SALEANT'
      FieldName = 'POS18COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 177
    end
    object pplDemoBalPatrppField179: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS19COL1SALEANT'
      FieldName = 'POS19COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 178
    end
    object pplDemoBalPatrppField180: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS20COL1SALEANT'
      FieldName = 'POS20COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 179
    end
    object pplDemoBalPatrppField181: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS21COL1SALEANT'
      FieldName = 'POS21COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 180
    end
    object pplDemoBalPatrppField182: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS22COL1SALEANT'
      FieldName = 'POS22COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 181
    end
    object pplDemoBalPatrppField183: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS23COL1SALEANT'
      FieldName = 'POS23COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 182
    end
    object pplDemoBalPatrppField184: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS24COL1SALEANT'
      FieldName = 'POS24COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 183
    end
    object pplDemoBalPatrppField185: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS25COL1SALEANT'
      FieldName = 'POS25COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 184
    end
    object pplDemoBalPatrppField186: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS26COL1SALEANT'
      FieldName = 'POS26COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 185
    end
    object pplDemoBalPatrppField187: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS27COL1SALEANT'
      FieldName = 'POS27COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 186
    end
    object pplDemoBalPatrppField188: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS28COL1SALEANT'
      FieldName = 'POS28COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 187
    end
    object pplDemoBalPatrppField189: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS29COL1SALEANT'
      FieldName = 'POS29COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 188
    end
    object pplDemoBalPatrppField190: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS30COL1SALEANT'
      FieldName = 'POS30COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 189
    end
    object pplDemoBalPatrppField191: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS31COL1SALEANT'
      FieldName = 'POS31COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 190
    end
    object pplDemoBalPatrppField192: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS32COL1SALEANT'
      FieldName = 'POS32COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 191
    end
    object pplDemoBalPatrppField193: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS33COL1SALEANT'
      FieldName = 'POS33COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 192
    end
    object pplDemoBalPatrppField194: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS34COL1SALEANT'
      FieldName = 'POS34COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 193
    end
    object pplDemoBalPatrppField195: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS35COL1SALEANT'
      FieldName = 'POS35COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 194
    end
    object pplDemoBalPatrppField196: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS36COL1SALEANT'
      FieldName = 'POS36COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 195
    end
    object pplDemoBalPatrppField197: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS37COL1SALEANT'
      FieldName = 'POS37COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 196
    end
    object pplDemoBalPatrppField198: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS38COL1SALEANT'
      FieldName = 'POS38COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 197
    end
    object pplDemoBalPatrppField199: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS39COL1SALEANT'
      FieldName = 'POS39COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 198
    end
    object pplDemoBalPatrppField200: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS40COL1SALEANT'
      FieldName = 'POS40COL1SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 199
    end
    object pplDemoBalPatrppField201: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS01COL2SALEANT'
      FieldName = 'POS01COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 200
    end
    object pplDemoBalPatrppField202: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS02COL2SALEANT'
      FieldName = 'POS02COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 201
    end
    object pplDemoBalPatrppField203: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS03COL2SALEANT'
      FieldName = 'POS03COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 202
    end
    object pplDemoBalPatrppField204: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS04COL2SALEANT'
      FieldName = 'POS04COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 203
    end
    object pplDemoBalPatrppField205: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS05COL2SALEANT'
      FieldName = 'POS05COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 204
    end
    object pplDemoBalPatrppField206: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS06COL2SALEANT'
      FieldName = 'POS06COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 205
    end
    object pplDemoBalPatrppField207: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS07COL2SALEANT'
      FieldName = 'POS07COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 206
    end
    object pplDemoBalPatrppField208: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS08COL2SALEANT'
      FieldName = 'POS08COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 207
    end
    object pplDemoBalPatrppField209: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS09COL2SALEANT'
      FieldName = 'POS09COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 208
    end
    object pplDemoBalPatrppField210: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS10COL2SALEANT'
      FieldName = 'POS10COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 209
    end
    object pplDemoBalPatrppField211: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS11COL2SALEANT'
      FieldName = 'POS11COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 210
    end
    object pplDemoBalPatrppField212: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS12COL2SALEANT'
      FieldName = 'POS12COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 211
    end
    object pplDemoBalPatrppField213: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS13COL2SALEANT'
      FieldName = 'POS13COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 212
    end
    object pplDemoBalPatrppField214: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS14COL2SALEANT'
      FieldName = 'POS14COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 213
    end
    object pplDemoBalPatrppField215: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS15COL2SALEANT'
      FieldName = 'POS15COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 214
    end
    object pplDemoBalPatrppField216: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS16COL2SALEANT'
      FieldName = 'POS16COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 215
    end
    object pplDemoBalPatrppField217: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS17COL2SALEANT'
      FieldName = 'POS17COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 216
    end
    object pplDemoBalPatrppField218: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS18COL2SALEANT'
      FieldName = 'POS18COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 217
    end
    object pplDemoBalPatrppField219: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS19COL2SALEANT'
      FieldName = 'POS19COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 218
    end
    object pplDemoBalPatrppField220: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS20COL2SALEANT'
      FieldName = 'POS20COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 219
    end
    object pplDemoBalPatrppField221: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS21COL2SALEANT'
      FieldName = 'POS21COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 220
    end
    object pplDemoBalPatrppField222: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS22COL2SALEANT'
      FieldName = 'POS22COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 221
    end
    object pplDemoBalPatrppField223: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS23COL2SALEANT'
      FieldName = 'POS23COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 222
    end
    object pplDemoBalPatrppField224: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS24COL2SALEANT'
      FieldName = 'POS24COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 223
    end
    object pplDemoBalPatrppField225: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS25COL2SALEANT'
      FieldName = 'POS25COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 224
    end
    object pplDemoBalPatrppField226: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS26COL2SALEANT'
      FieldName = 'POS26COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 225
    end
    object pplDemoBalPatrppField227: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS27COL2SALEANT'
      FieldName = 'POS27COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 226
    end
    object pplDemoBalPatrppField228: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS28COL2SALEANT'
      FieldName = 'POS28COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 227
    end
    object pplDemoBalPatrppField229: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS29COL2SALEANT'
      FieldName = 'POS29COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 228
    end
    object pplDemoBalPatrppField230: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS30COL2SALEANT'
      FieldName = 'POS30COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 229
    end
    object pplDemoBalPatrppField231: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS31COL2SALEANT'
      FieldName = 'POS31COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 230
    end
    object pplDemoBalPatrppField232: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS32COL2SALEANT'
      FieldName = 'POS32COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 231
    end
    object pplDemoBalPatrppField233: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS33COL2SALEANT'
      FieldName = 'POS33COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 232
    end
    object pplDemoBalPatrppField234: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS34COL2SALEANT'
      FieldName = 'POS34COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 233
    end
    object pplDemoBalPatrppField235: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS35COL2SALEANT'
      FieldName = 'POS35COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 234
    end
    object pplDemoBalPatrppField236: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS36COL2SALEANT'
      FieldName = 'POS36COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 235
    end
    object pplDemoBalPatrppField237: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS37COL2SALEANT'
      FieldName = 'POS37COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 236
    end
    object pplDemoBalPatrppField238: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS38COL2SALEANT'
      FieldName = 'POS38COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 237
    end
    object pplDemoBalPatrppField239: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS39COL2SALEANT'
      FieldName = 'POS39COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 238
    end
    object pplDemoBalPatrppField240: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS40COL2SALEANT'
      FieldName = 'POS40COL2SALEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 239
    end
    object pplDemoBalPatrppField241: TppField
      FieldAlias = 'CCUSTO'
      FieldName = 'CCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 240
    end
    object pplDemoBalPatrppField242: TppField
      FieldAlias = 'ATIVPROJ'
      FieldName = 'ATIVPROJ'
      FieldLength = 10
      DisplayWidth = 10
      Position = 241
    end
    object pplDemoBalPatrppField243: TppField
      FieldAlias = 'DATAULTDIA'
      FieldName = 'DATAULTDIA'
      FieldLength = 9
      DisplayWidth = 9
      Position = 242
    end
    object pplDemoBalPatrppField244: TppField
      FieldAlias = 'PERIODOINI'
      FieldName = 'PERIODOINI'
      FieldLength = 15
      DisplayWidth = 15
      Position = 243
    end
    object pplDemoBalPatrppField245: TppField
      FieldAlias = 'PERIODOFIM'
      FieldName = 'PERIODOFIM'
      FieldLength = 15
      DisplayWidth = 15
      Position = 244
    end
    object pplDemoBalPatrppField246: TppField
      FieldAlias = 'EXERCICIO'
      FieldName = 'EXERCICIO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 245
    end
  end
  object pplDemoColunado: TppBDEPipeline
    DataSource = dsDemoColunado
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Consulta1'
    Left = 369
    Top = 179
    object pplDemoColunadoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA1'
      FieldName = 'COLUNA1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplDemoColunadoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA2'
      FieldName = 'COLUNA2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplDemoColunadoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA3'
      FieldName = 'COLUNA3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplDemoColunadoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA4'
      FieldName = 'COLUNA4'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplDemoColunadoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA5'
      FieldName = 'COLUNA5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplDemoColunadoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA6'
      FieldName = 'COLUNA6'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplDemoColunadoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA7'
      FieldName = 'COLUNA7'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplDemoColunadoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA8'
      FieldName = 'COLUNA8'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplDemoColunadoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA9'
      FieldName = 'COLUNA9'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplDemoColunadoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA10'
      FieldName = 'COLUNA10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplDemoColunadoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA11'
      FieldName = 'COLUNA11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplDemoColunadoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'COLUNA12'
      FieldName = 'COLUNA12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplDemoColunadoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTREPRIM_ULT'
      FieldName = 'PERCENTREPRIM_ULT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplDemoColunadoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SOMATORIOLINHA'
      FieldName = 'SOMATORIOLINHA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplDemoColunadoppField15: TppField
      FieldAlias = 'COLUNA1S'
      FieldName = 'COLUNA1S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object pplDemoColunadoppField16: TppField
      FieldAlias = 'COLUNA2S'
      FieldName = 'COLUNA2S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object pplDemoColunadoppField17: TppField
      FieldAlias = 'COLUNA3S'
      FieldName = 'COLUNA3S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object pplDemoColunadoppField18: TppField
      FieldAlias = 'COLUNA4S'
      FieldName = 'COLUNA4S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object pplDemoColunadoppField19: TppField
      FieldAlias = 'COLUNA5S'
      FieldName = 'COLUNA5S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object pplDemoColunadoppField20: TppField
      FieldAlias = 'COLUNA6S'
      FieldName = 'COLUNA6S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object pplDemoColunadoppField21: TppField
      FieldAlias = 'COLUNA7S'
      FieldName = 'COLUNA7S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object pplDemoColunadoppField22: TppField
      FieldAlias = 'COLUNA8S'
      FieldName = 'COLUNA8S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object pplDemoColunadoppField23: TppField
      FieldAlias = 'COLUNA9S'
      FieldName = 'COLUNA9S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object pplDemoColunadoppField24: TppField
      FieldAlias = 'COLUNA10S'
      FieldName = 'COLUNA10S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object pplDemoColunadoppField25: TppField
      FieldAlias = 'COLUNA11S'
      FieldName = 'COLUNA11S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object pplDemoColunadoppField26: TppField
      FieldAlias = 'COLUNA12S'
      FieldName = 'COLUNA12S'
      FieldLength = 1
      DisplayWidth = 1
      Position = 25
    end
    object pplDemoColunadoppField27: TppField
      FieldAlias = 'PERCENTREPRIM_ULTS'
      FieldName = 'PERCENTREPRIM_ULTS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 26
    end
    object pplDemoColunadoppField28: TppField
      FieldAlias = 'SOMATORIOLINHAS'
      FieldName = 'SOMATORIOLINHAS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 27
    end
    object pplDemoColunadoppField29: TppField
      FieldAlias = 'FLAGCALCINTERNA1'
      FieldName = 'FLAGCALCINTERNA1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object pplDemoColunadoppField30: TppField
      FieldAlias = 'FLAGCALCINTERNA2'
      FieldName = 'FLAGCALCINTERNA2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 29
    end
    object pplDemoColunadoppField31: TppField
      FieldAlias = 'FLAGCALCINTERNA3'
      FieldName = 'FLAGCALCINTERNA3'
      FieldLength = 1
      DisplayWidth = 1
      Position = 30
    end
    object pplDemoColunadoppField32: TppField
      FieldAlias = 'FLAGCALCINTERNA4'
      FieldName = 'FLAGCALCINTERNA4'
      FieldLength = 1
      DisplayWidth = 1
      Position = 31
    end
    object pplDemoColunadoppField33: TppField
      FieldAlias = 'FLAGCALCINTERNA5'
      FieldName = 'FLAGCALCINTERNA5'
      FieldLength = 1
      DisplayWidth = 1
      Position = 32
    end
    object pplDemoColunadoppField34: TppField
      FieldAlias = 'FLAGCALCINTERNA6'
      FieldName = 'FLAGCALCINTERNA6'
      FieldLength = 1
      DisplayWidth = 1
      Position = 33
    end
    object pplDemoColunadoppField35: TppField
      FieldAlias = 'FLAGCALCINTERNA7'
      FieldName = 'FLAGCALCINTERNA7'
      FieldLength = 1
      DisplayWidth = 1
      Position = 34
    end
    object pplDemoColunadoppField36: TppField
      FieldAlias = 'FLAGCALCINTERNA8'
      FieldName = 'FLAGCALCINTERNA8'
      FieldLength = 1
      DisplayWidth = 1
      Position = 35
    end
    object pplDemoColunadoppField37: TppField
      FieldAlias = 'FLAGCALCINTERNA9'
      FieldName = 'FLAGCALCINTERNA9'
      FieldLength = 1
      DisplayWidth = 1
      Position = 36
    end
    object pplDemoColunadoppField38: TppField
      FieldAlias = 'FLAGCALCINTERNA10'
      FieldName = 'FLAGCALCINTERNA10'
      FieldLength = 1
      DisplayWidth = 1
      Position = 37
    end
    object pplDemoColunadoppField39: TppField
      FieldAlias = 'FLAGCALCINTERNA11'
      FieldName = 'FLAGCALCINTERNA11'
      FieldLength = 1
      DisplayWidth = 1
      Position = 38
    end
    object pplDemoColunadoppField40: TppField
      FieldAlias = 'FLAGCALCINTERNA12'
      FieldName = 'FLAGCALCINTERNA12'
      FieldLength = 1
      DisplayWidth = 1
      Position = 39
    end
    object pplDemoColunadoppField41: TppField
      FieldAlias = 'FLGPASSATRACO'
      FieldName = 'FLGPASSATRACO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 40
    end
    object pplDemoColunadoppField42: TppField
      FieldAlias = 'FLGTRACOSIMPLES'
      FieldName = 'FLGTRACOSIMPLES'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object pplDemoColunadoppField43: TppField
      FieldAlias = 'FLGTRACODUPLO'
      FieldName = 'FLGTRACODUPLO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 42
    end
    object pplDemoColunadoppField44: TppField
      FieldAlias = 'NOMELINHA'
      FieldName = 'NOMELINHA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 43
    end
    object pplDemoColunadoppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODIGOLINHA'
      FieldName = 'CODIGOLINHA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object pplDemoColunadoppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORDEMLINHA'
      FieldName = 'ORDEMLINHA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object pplDemoColunadoppField47: TppField
      FieldAlias = 'NATUREZAELEMENTO'
      FieldName = 'NATUREZAELEMENTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 46
    end
    object pplDemoColunadoppField48: TppField
      FieldAlias = 'DATAULTDIA'
      FieldName = 'DATAULTDIA'
      FieldLength = 9
      DisplayWidth = 9
      Position = 47
    end
    object pplDemoColunadoppField49: TppField
      FieldAlias = 'FLAGMONETARIA'
      FieldName = 'FLAGMONETARIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 48
    end
    object pplDemoColunadoppField50: TppField
      FieldAlias = 'CCUSTO'
      FieldName = 'CCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 49
    end
    object pplDemoColunadoppField51: TppField
      FieldAlias = 'ATIVPROJ'
      FieldName = 'ATIVPROJ'
      FieldLength = 10
      DisplayWidth = 10
      Position = 50
    end
    object pplDemoColunadoppField52: TppField
      FieldAlias = 'PERIODOINI'
      FieldName = 'PERIODOINI'
      FieldLength = 15
      DisplayWidth = 15
      Position = 51
    end
    object pplDemoColunadoppField53: TppField
      FieldAlias = 'PERIODOFIM'
      FieldName = 'PERIODOFIM'
      FieldLength = 15
      DisplayWidth = 15
      Position = 52
    end
    object pplDemoColunadoppField54: TppField
      FieldAlias = 'EXERCICIO'
      FieldName = 'EXERCICIO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 53
    end
  end
  object ppConsulta: TppBDEPipeline
    DataSource = DsConsulta
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Consulta'
    Left = 285
    Top = 178
    object ppConsultappField1: TppField
      FieldAlias = 'SALDOREALPEREAT'
      FieldName = 'SALDOREALPEREAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppConsultappField2: TppField
      FieldAlias = 'SALDOORCPEREAT'
      FieldName = 'SALDOORCPEREAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppConsultappField3: TppField
      FieldAlias = 'SALDOREALACUMEAT'
      FieldName = 'SALDOREALACUMEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppConsultappField4: TppField
      FieldAlias = 'SALDOORCACUMEAT'
      FieldName = 'SALDOORCACUMEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppConsultappField5: TppField
      FieldAlias = 'SALDOREALPEREAN'
      FieldName = 'SALDOREALPEREAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppConsultappField6: TppField
      FieldAlias = 'SALDOREALACUMEAN'
      FieldName = 'SALDOREALACUMEAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppConsultappField7: TppField
      FieldAlias = 'SALDOREAPERANTEAT'
      FieldName = 'SALDOREAPERANTEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppConsultappField8: TppField
      FieldAlias = 'SALDREALPEREATS'
      FieldName = 'SALDREALPEREATS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppConsultappField9: TppField
      FieldAlias = 'SALDORCPEREATS'
      FieldName = 'SALDORCPEREATS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppConsultappField10: TppField
      FieldAlias = 'SALDREALACUMEATS'
      FieldName = 'SALDREALACUMEATS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppConsultappField11: TppField
      FieldAlias = 'SALDORCACUMEATS'
      FieldName = 'SALDORCACUMEATS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppConsultappField12: TppField
      FieldAlias = 'SALDREALPEREANS'
      FieldName = 'SALDREALPEREANS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppConsultappField13: TppField
      FieldAlias = 'SALDREALACUMEANS'
      FieldName = 'SALDREALACUMEANS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppConsultappField14: TppField
      FieldAlias = 'SALDREAPERANTEATS'
      FieldName = 'SALDREAPERANTEATS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppConsultappField15: TppField
      FieldAlias = 'DIFORCREALPEREAT'
      FieldName = 'DIFORCREALPEREAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppConsultappField16: TppField
      FieldAlias = 'AV_REALPEREAT'
      FieldName = 'AV_REALPEREAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppConsultappField17: TppField
      FieldAlias = 'AV_ORCPEREAT'
      FieldName = 'AV_ORCPEREAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppConsultappField18: TppField
      FieldAlias = 'AH_ORCREALPEREAT'
      FieldName = 'AH_ORCREALPEREAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppConsultappField19: TppField
      FieldAlias = 'DIFORCREALACUMEAT'
      FieldName = 'DIFORCREALACUMEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppConsultappField20: TppField
      FieldAlias = 'AV_REALACUMEAT'
      FieldName = 'AV_REALACUMEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppConsultappField21: TppField
      FieldAlias = 'AV_ORCACUMEAT'
      FieldName = 'AV_ORCACUMEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppConsultappField22: TppField
      FieldAlias = 'AH_ORCREALACUMEAT'
      FieldName = 'AH_ORCREALACUMEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppConsultappField23: TppField
      FieldAlias = 'DIFEXATUANTPER'
      FieldName = 'DIFEXATUANTPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppConsultappField24: TppField
      FieldAlias = 'AV_REALPEREAN'
      FieldName = 'AV_REALPEREAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppConsultappField25: TppField
      FieldAlias = 'AH_EXATUANTPER'
      FieldName = 'AH_EXATUANTPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppConsultappField26: TppField
      FieldAlias = 'DIFEXATUANTACUM'
      FieldName = 'DIFEXATUANTACUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppConsultappField27: TppField
      FieldAlias = 'AV_REALACUMEAN'
      FieldName = 'AV_REALACUMEAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppConsultappField28: TppField
      FieldAlias = 'AH_EXATUANTACUM'
      FieldName = 'AH_EXATUANTACUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppConsultappField29: TppField
      FieldAlias = 'DIFPERATUANTEAT'
      FieldName = 'DIFPERATUANTEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppConsultappField30: TppField
      FieldAlias = 'AV_REALPERANTEAT'
      FieldName = 'AV_REALPERANTEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppConsultappField31: TppField
      FieldAlias = 'AH_PERATUANTEAT'
      FieldName = 'AH_PERATUANTEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppConsultappField32: TppField
      FieldAlias = 'SALDOINIEAT'
      FieldName = 'SALDOINIEAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppConsultappField33: TppField
      FieldAlias = 'TOTALDEBPEREAT'
      FieldName = 'TOTALDEBPEREAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppConsultappField34: TppField
      FieldAlias = 'TOTALCREPEREAT'
      FieldName = 'TOTALCREPEREAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppConsultappField35: TppField
      FieldAlias = 'MOVPEREAT'
      FieldName = 'MOVPEREAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppConsultappField36: TppField
      FieldAlias = 'FLAGCALCINTERNA'
      FieldName = 'FLAGCALCINTERNA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppConsultappField37: TppField
      FieldAlias = 'FLAGTIPONEGATIVO'
      FieldName = 'FLAGTIPONEGATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppConsultappField38: TppField
      FieldAlias = 'NOMEELEMENTOIND'
      FieldName = 'NOMEELEMENTOIND'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppConsultappField39: TppField
      FieldAlias = 'NOMEELEMENTO'
      FieldName = 'NOMEELEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppConsultappField40: TppField
      FieldAlias = 'ORDEMELEMENTO'
      FieldName = 'ORDEMELEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppConsultappField41: TppField
      FieldAlias = 'CODIGOELEMENTO'
      FieldName = 'CODIGOELEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppConsultappField42: TppField
      FieldAlias = 'TIPOELEMENTO'
      FieldName = 'TIPOELEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppConsultappField43: TppField
      FieldAlias = 'NATUREZAELEMENTO'
      FieldName = 'NATUREZAELEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppConsultappField44: TppField
      FieldAlias = 'INDENTACAO'
      FieldName = 'INDENTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppConsultappField45: TppField
      FieldAlias = 'FLAGMONETARIA'
      FieldName = 'FLAGMONETARIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppConsultappField46: TppField
      FieldAlias = 'ELEMANALISEVERT'
      FieldName = 'ELEMANALISEVERT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppConsultappField47: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppConsultappField48: TppField
      FieldAlias = 'SALTAPAG'
      FieldName = 'SALTAPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppConsultappField49: TppField
      FieldAlias = 'LINHA1'
      FieldName = 'LINHA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppConsultappField50: TppField
      FieldAlias = 'DATAULTDIA'
      FieldName = 'DATAULTDIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppConsultappField51: TppField
      FieldAlias = 'LINHA2'
      FieldName = 'LINHA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppConsultappField52: TppField
      FieldAlias = 'LINHA3'
      FieldName = 'LINHA3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppConsultappField53: TppField
      FieldAlias = 'CCUSTO'
      FieldName = 'CCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppConsultappField54: TppField
      FieldAlias = 'ATIVPROJ'
      FieldName = 'ATIVPROJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppConsultappField55: TppField
      FieldAlias = 'FLAGINTERNA1'
      FieldName = 'FLAGINTERNA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppConsultappField56: TppField
      FieldAlias = 'FLAGINTERNA2'
      FieldName = 'FLAGINTERNA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppConsultappField57: TppField
      FieldAlias = 'PERIODOINI'
      FieldName = 'PERIODOINI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppConsultappField58: TppField
      FieldAlias = 'PERIODOFIM'
      FieldName = 'PERIODOFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppConsultappField59: TppField
      FieldAlias = 'EXERCICIO'
      FieldName = 'EXERCICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
  end
  object CdsDemonstrativo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 73
    Top = 63
  end
  object CdsReports: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 55
  end
  object DsConsulta: TwwDataSource
    DataSet = CdsDemoNormal
    Left = 24
    Top = 183
  end
  object dsDemoBalPatr: TwwDataSource
    DataSet = CdsDemoBalPatr
    Left = 80
    Top = 183
  end
  object dsDemoColunado: TwwDataSource
    DataSet = CdsDemoColunado
    Left = 24
    Top = 231
  end
  object dsDemoColMes: TwwDataSource
    DataSet = CdsDemoColMes
    Left = 80
    Top = 223
  end
  object CdsDemoNormal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 279
  end
  object CdsDemoColMes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 287
  end
  object CdsDemoBalPatr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 279
  end
  object CdsDemoColunado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 280
  end
  object MergeMenu: TMainMenu
    Left = 216
    Top = 64
    object mniFile: TMenuItem
      Caption = '&Arquivo'
      GroupIndex = 10
      object mniFileSave: TMenuItem
        Caption = '&Salvar'
        ShortCut = 16467
      end
      object mniFileLine3: TMenuItem
        Caption = '-'
      end
      object mniFilePageSetup: TMenuItem
        Caption = 'Configurar &Página'
      end
      object mniFilePrintToFileSetup: TMenuItem
        Caption = 'Configuração da Impressão Para &Arquivo'
      end
      object mniFileLine4: TMenuItem
        Caption = '-'
      end
      object mniFilePrint: TMenuItem
        Caption = '&Imprimir'
        ShortCut = 16464
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object MnuRlatorio: TMenuItem
      Caption = '&Relatório'
      GroupIndex = 60
      Visible = False
      object MnuTitulo: TMenuItem
        Caption = '&Título'
      end
      object MnuSumario: TMenuItem
        Caption = '&Sumário'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object MnuCabecalho: TMenuItem
        Caption = '&Cabeçalho'
      end
      object MnuRodape: TMenuItem
        Caption = '&Rodapé'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MnuGrupos: TMenuItem
        Caption = '&Grupos'
        ShortCut = 16455
      end
      object MnuLInha: TMenuItem
        Caption = '-'
        ShortCut = 189
      end
      object MnuRetrato: TMenuItem
        Caption = '&Retrato'
      end
      object MnuPaisagem: TMenuItem
        Caption = '&Paisagem'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object MnuUnidades: TMenuItem
        Caption = '&Unidades'
        object MnuPixelsTela: TMenuItem
          Caption = 'Pixels de &Tela'
        end
        object MnuPixelsImpressora: TMenuItem
          Caption = 'Pixels de &Impressora'
        end
        object MnuPolegada: TMenuItem
          Caption = '&Polegada'
        end
        object MnuMilimetros: TMenuItem
          Caption = '&Milímetros'
        end
        object MnuMMilimetros: TMenuItem
          Caption = '&Milhares de Milímetros'
        end
      end
    end
  end
end
