inherited frmCadRegHon: TfrmCadRegHon
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      object Label30: TLabel [2]
        Left = 137
        Top = 5
        Width = 92
        Height = 13
        Caption = 'Número na Vara'
        FocusControl = dbedNumJCJ
      end
      object Label13: TLabel [3]
        Left = 264
        Top = 5
        Width = 77
        Height = 13
        Caption = 'Vara Nº (JCJ)'
        FocusControl = dbedJCJ
      end
      object Label20: TLabel [4]
        Left = 391
        Top = 5
        Width = 219
        Height = 13
        Caption = 'Órgão Jurisdicional (Vara do Trabalho)'
      end
      object dbedNumJCJ: TDBEdit
        Left = 137
        Top = 20
        Width = 120
        Height = 21
        DataField = 'PROCJCJNUM'
        DataSource = ds
        TabOrder = 4
      end
      object dbedJCJ: TDBEdit
        Left = 264
        Top = 20
        Width = 120
        Height = 21
        DataField = 'JCJ'
        DataSource = ds
        TabOrder = 5
      end
      object dblckVara: TwwDBLookupCombo
        Left = 391
        Top = 20
        Width = 320
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO')
        DataField = 'IDVARAJUSTICA'
        DataSource = ds
        LookupTable = CdsVara
        LookupField = 'IDVARAJUSTICA'
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        UseTFields = False
        AllowClearKey = True
      end
      object rgSituacao: TDBRadioGroup
        Left = 264
        Top = 46
        Width = 120
        Height = 49
        Caption = 'Situação'
        DataField = 'FLGSITPROC'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Aberto'
          'Encerrado')
        ReadOnly = True
        TabOrder = 7
        Values.Strings = (
          '0'
          '1')
      end
      object CMProcuraContraparte: TCMProcuraSubTipo
        Left = 391
        Top = 45
        Width = 320
        Height = 50
        Caption = 'Contraparte'
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 8
        CampoEdit = ceNome
        MostraMensagens = False
        DataSource = ds
        DataField = 'IDRECLAMANTE'
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        SubTipo = stFuncionario
        FiltraSubTipo = True
      end
    end
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.JCJ'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.PROCJCJNUM'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Contraparte'
      'Data de Notificação'
      'Número da Vara (JCJ)'
      'Nome do Órgão'
      'Número Proc. na 1ª Inst'
      'Número Proc. na 2ª Inst'
      'Número Proc. Interno')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.INDMATERIA   = 1'
      'PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '50'
      '15'
      '15'
      '15')
  end
end
