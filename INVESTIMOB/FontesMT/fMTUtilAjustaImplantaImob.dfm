inherited frmMTUtilAjustaImplantaImob: TfrmMTUtilAjustaImplantaImob
  Left = 122
  Top = 119
  Caption = 'Lançamento de Ajuste de Implantação'
  ClientHeight = 398
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 359
    inherited Label26: TLabel
      Top = 46
    end
    inherited lblPlaca: TLabel
      Left = 181
      Top = 96
    end
    inherited Label2: TLabel
      Left = 306
      Top = 96
    end
    object Label27: TLabel [3]
      Left = 16
      Top = 6
      Width = 99
      Height = 13
      Caption = 'Código do Imóvel'
    end
    object Label28: TLabel [4]
      Left = 124
      Top = 6
      Width = 92
      Height = 13
      Caption = 'Nome do Imóvel'
    end
    object Label29: TLabel [5]
      Left = 16
      Top = 96
      Width = 72
      Height = 13
      Caption = 'Tipo de Bem'
    end
    inherited Label271: TLabel
      Left = 430
      Top = 96
    end
    inherited dbeDesBem: TwwDBRichEdit
      Top = 60
      Height = 31
      Enabled = False
      ReadOnly = True
      RichEditVersion = 2
      Data = {
        750000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
        4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
        5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
    end
    inherited bbtnSelBem: TBitBtn
      Top = 22
      Width = 38
      Height = 69
    end
    inherited dbePlaca: TwwDBEdit
      Left = 181
      Top = 110
    end
    inherited edDataBase: TCMDateTimePicker
      Left = 306
      Top = 110
    end
    inherited pgctlValores: TPageControl
      Top = 147
    end
    inherited edValResidual: TRealEdit
      Left = 430
      Top = 110
      Width = 121
      TabOrder = 8
    end
    object edImovel: TEdit
      Left = 124
      Top = 22
      Width = 389
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
    object edImoCodigo: TEdit
      Left = 16
      Top = 22
      Width = 105
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
    object edTipoBem: TEdit
      Left = 16
      Top = 110
      Width = 161
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 7
    end
    object btnCriaReaval: TButton
      Left = 416
      Top = 136
      Width = 129
      Height = 25
      Caption = 'Cria Reavaliação'
      Enabled = False
      TabOrder = 9
      OnClick = btnCriaReavalClick
    end
  end
  inherited Dock971: TDock97
    Top = 359
  end
  inherited MSBem: TMontaSelect
    Colunas.Strings = (
      'I.IMOCODIGO'
      
        'DECODE(IMOVELXBEM.IXBGRUPO,'#39'T'#39','#39'Terreno'#39','#39'I'#39','#39'Instalações Elétri' +
        'cas'#39','#39'E'#39','#39'Edificação'#39')'
      'IM.IMONOME'
      'I.IMONOME'
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Imovel'
      'Tipo de Bem'
      'Imóvel Mestre'
      'Imóvel'
      'Nº de Tombamento'
      'Baixado'
      'Descrição do Bem'
      'Classe'
      'Grupo Contábil')
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
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'PLANOGRUPO'
      'IMOVELXBEM'
      'IMOVEL I'
      'IMOVEL IM')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'GRUPO.FLGIMOVEL'
      'IM.IMONOME || '#39' - '#39' || I.IMONOME'
      'I.IMOCODIGO'
      
        'DECODE(IMOVELXBEM.IXBGRUPO,'#39'T'#39','#39'TERRENO'#39','#39'I'#39','#39'INSTALAÇÕES ELÉTRI' +
        'CAS'#39','#39'E'#39','#39'EDIFICAÇÃO'#39')')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      'BEM.IDBEM = IMOVELXBEM.IDBEM'
      'IMOVELXBEM.IDIMOVEL = I.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      '1=1')
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
      '15'
      '20'
      '30'
      '30'
      '10'
      '1'
      '80'
      '20'
      '60')
  end
end
