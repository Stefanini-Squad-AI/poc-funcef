inherited frmCadRegHon: TfrmCadRegHon
  HelpContext = 1100015
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      object Label3: TLabel [2]
        Left = 264
        Top = 5
        Width = 118
        Height = 13
        Caption = 'Número do Processo'
        FocusControl = dbedNumJCJ
      end
      object Label13: TLabel [3]
        Left = 137
        Top = 5
        Width = 27
        Height = 13
        Caption = 'Vara'
        FocusControl = dbedJCJ
      end
      inherited StaticText1: TStaticText
        Width = 96
        Caption = 'Data da Citação'
      end
      object dbedNumJCJ: TDBEdit
        Left = 264
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
      object dbedJCJ: TDBEdit
        Left = 137
        Top = 20
        Width = 120
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'JCJ'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object dbrgMateria: TDBRadioGroup
        Left = 391
        Top = 4
        Width = 320
        Height = 38
        Caption = 'Matéria'
        Columns = 2
        DataField = 'INDMATERIA'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Previd. Apenas'
          'Previd. e Trabalhista')
        ReadOnly = True
        TabOrder = 6
        Values.Strings = (
          '2'
          '3')
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        CampoEdit = ceRazaoSocial
        MostraMensagens = False
        DataSource = ds
        DataField = 'IDRECLAMANTE'
        Mensagens.EmBranco = 'Chave não pode estar em branco'
        Mensagens.NaoExiste = 'Chave não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        SubTipo = stElegivel
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
      'PROCESSOTRAB.FLGSITPROC'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCEXEC'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Contraparte'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Órgão Jurisd. (Vara)'
      'Situação: 0=Abrt,1=Enc.'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número da Precatória'
      'Número Proc. Interno')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Mascaras.Strings = (
      ''
      ''
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
      '40'
      '15'
      '15'
      '15'
      '25'
      '15')
  end
end
