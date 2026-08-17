inherited frmMTCadResponsavel: TfrmMTCadResponsavel
  Left = 1
  Top = 75
  Caption = 'Cadastro de Responsáveis'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Responsáveis')
      inherited pgctrlDetalhe: TPageControl
        ActivePage = TabResponsavel
        object TabResponsavel: TTabSheet
          Caption = 'Responsável'
          ImageIndex = 5
          object plnRespon: TPanel
            Left = 208
            Top = 9
            Width = 305
            Height = 161
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            object chkAtivoFixo: TDBCheckBox
              Left = 16
              Top = 56
              Width = 241
              Height = 17
              Caption = 'Responsável pelos bens do Ativo Fixo'
              DataField = 'FLGATIVOFIXO'
              DataSource = dsSubTipo
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object chkContrato: TDBCheckBox
              Left = 16
              Top = 88
              Width = 241
              Height = 17
              Caption = 'Responsável pelos bens do Contrato'
              DataField = 'FLGCONTRATO'
              DataSource = dsSubTipo
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object chkProjeto: TDBCheckBox
              Left = 16
              Top = 120
              Width = 233
              Height = 17
              Caption = 'Responsável pelos bens do Projeto'
              DataField = 'FLGPROJETO'
              DataSource = dsSubTipo
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object plnCapBem: TPanel
              Left = 2
              Top = 2
              Width = 301
              Height = 31
              Align = alTop
              BevelInner = bvLowered
              Caption = 'Responsabilidades'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
          end
        end
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Responsável'
    Colunas.Strings = (
      'PESSOA.NOME'
      'TO_CHAR(DECODE(RESPONSAVEL.FLGATIVOFIXO,1,'#39'S'#39','#39'N'#39'))')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'RESPONSAVEL')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=RESPONSAVEL.IDRESPONSAVEL(+)')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '15')
    Left = 296
    Top = 56
  end
  inherited dsSubTipo: TwwDataSource
    Left = 692
  end
  inherited MSGrupo: TMontaSelect
    Left = 553
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 693
  end
  inherited MsCidades: TMontaSelect
    Left = 623
  end
  inherited MsBanco: TMontaSelect
    Left = 666
  end
  inherited ppmCaixa: TPopupMenu
    Left = 725
  end
end
