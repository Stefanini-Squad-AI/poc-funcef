inherited frmCadRegHon: TfrmCadRegHon
  HelpContext = 1110016
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      object Label3: TLabel [2]
        Left = 137
        Top = 5
        Width = 118
        Height = 13
        Caption = 'Número do Processo'
        FocusControl = dbedNumJCJ2
      end
      object dbedNumJCJ2: TDBEdit
        Left = 137
        Top = 20
        Width = 120
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'PROCJCJNUM'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object rgAtivo: TDBRadioGroup
        Left = 264
        Top = 4
        Width = 119
        Height = 45
        Caption = 'Somos a Parte'
        DataField = 'FLGPARTEATIVA'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Ativa'
          'Passiva')
        ReadOnly = True
        TabOrder = 5
        Values.Strings = (
          '1'
          '0')
      end
      object dbrgMateria: TDBRadioGroup
        Left = 391
        Top = 4
        Width = 320
        Height = 38
        Caption = 'Matéria'
        Columns = 4
        DataField = 'INDMATERIA'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Civil'
          'Comercial'
          'Tributária'
          'Penal')
        ReadOnly = True
        TabOrder = 6
        Values.Strings = (
          '4'
          '5'
          '6'
          '7'
          ''
          '')
      end
      object rgSituacao: TDBRadioGroup
        Left = 264
        Top = 50
        Width = 120
        Height = 45
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
      object CMProcuraRequerente: TCMProcuraSubTipo
        Left = 391
        Top = 45
        Width = 320
        Height = 50
        Caption = 'Contraparte'
        Enabled = False
        TabOrder = 8
        CampoEdit = ceRazaoSocial
        MostraMensagens = False
        DataSource = ds
        DataField = 'IDRECLAMANTE'
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        SubTipo = stFornecedor
        FiltraSubTipo = True
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.NUMVARAJUSTICA'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Contra-Parte'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Vara de Justiça'
      'Número da Vara'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA  = VARAJUSTICA .IDVARAJUSTICA(+)'
      'PROCESSOTRAB.INDMATERIA       > 3')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '15')
  end
end
