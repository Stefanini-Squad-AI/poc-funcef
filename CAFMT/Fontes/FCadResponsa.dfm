inherited frmCadResponsa: TfrmCadResponsa
  Left = -1
  Top = 47
  HelpContext = 70012
  Caption = 'Responsavel'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 58
      Height = 321
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Responsável')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        '')
      inherited pgctrlDetalhe: TPageControl
        Height = 262
        inherited tbsDocumento: TTabSheet
          inherited PnlDocumentos_Padrao: TPanel [0]
            Height = 234
            inherited lstDocumentos: TListView [0]
              Height = 232
            end
            inherited pnlItemsDoc: TPanel [1]
              Height = 232
            end
            inherited pnlFoto: TPanel [2]
              Height = 232
              inherited Bevel1: TBevel
                Height = 236
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 236
                inherited btnAssociarimgPessoa: TButton
                  Left = 520
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Height = 236
                inherited imgPessoa: TDBImage
                  Left = 520
                end
              end
            end
          end
          inherited PgCtrlPesFisica_Padrao: TPageControl [1]
            Height = 234
            ActivePage = TbsDadosPessoais_Padrao
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Height = 234
            inherited grpTipoEnd: TGroupBox
              Height = 234
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Height = 234
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Height = 234
          end
          inherited Panel1: TPanel
            Height = 234
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Height = 234
          end
          inherited dbgContato: TwwDBGrid
            Height = 234
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Responsável'
          object plnRespon: TPanel
            Left = 208
            Top = 32
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
      inherited Dock974: TDock97
        Height = 262
      end
    end
    inherited pnlMestre: TPanel
      Height = 53
      inherited lblNome: TLabel
        Width = 33
        Caption = 'Nome'
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 180
      end
      inherited sbtnFisJur: TToolbarButton97
        Left = 333
      end
      object bbtnSelResp: TToolbarButton97
        Left = 240
        Top = 0
        Width = 93
        Height = 41
        AllowAllUp = True
        DropdownCombo = True
        Caption = '&Responsáveis'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = bbtnSelRespClick
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70012
      end
    end
  end
  inherited qry: TwwQuery
    Left = 449
  end
  inherited dsDet: TwwDataSource
    Left = 578
  end
  inherited upd: TUpdateSQL
    Left = 510
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Pessoa'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    Left = 611
  end
  inherited ds: TwwDataSource
    Left = 480
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update RESPONSAVEL'
      'set'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  FLGATIVOFIXO = :FLGATIVOFIXO,'
      '  FLGCONTRATO = :FLGCONTRATO,'
      '  FLGPROJETO = :FLGPROJETO'
      'where'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL')
    InsertSQL.Strings = (
      'insert into RESPONSAVEL'
      '  (IDRESPONSAVEL, FLGATIVOFIXO, FLGCONTRATO, FLGPROJETO)'
      'values'
      '  (:IDRESPONSAVEL, :FLGATIVOFIXO, :FLGCONTRATO, :FLGPROJETO)')
    DeleteSQL.Strings = (
      'delete from RESPONSAVEL'
      'where'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL')
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT RESPONSAVEL.IDRESPONSAVEL,RESPONSAVEL.FLGATIVOFIXO,'
      'RESPONSAVEL.FLGCONTRATO,RESPONSAVEL.FLGPROJETO'
      'FROM RESPONSAVEL'
      'WHERE ( RESPONSAVEL.IDRESPONSAVEL =:IdPessoa )')
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 476
    Top = 121
  end
  inherited ImageList1: TImageList
    Left = 64
    Top = 326
  end
  inherited qryTelefone: TwwQuery
    Left = 386
  end
  inherited updTelefone: TUpdateSQL
    Left = 442
  end
  inherited dsTelefone: TwwDataSource
    Left = 489
  end
  inherited dsEndereco: TwwDataSource
    Left = 752
    Top = 265
  end
  inherited updEndereco: TUpdateSQL
    Left = 705
    Top = 262
  end
  inherited qryEndereco: TwwQuery
    Left = 660
    Top = 261
  end
  inherited qryContato: TwwQuery
    Left = 663
    Top = 306
  end
  inherited updContato: TUpdateSQL
    Left = 705
    Top = 306
  end
  inherited dsContato: TwwDataSource
    Left = 752
    Top = 306
  end
  inherited qryRamal: TwwQuery
    Left = 657
    Top = 359
  end
  inherited updRamal: TUpdateSQL
    Left = 705
    Top = 359
  end
  inherited dsRamal: TwwDataSource
    Left = 752
    Top = 359
  end
  inherited Pessoa: TPessoa
    TipoPessoa = tpFisica
    SubTipo = stResponsavel
    Left = 660
    Top = 0
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 129
    Top = 326
  end
  inherited qryTipoDoc: TwwQuery
    Left = 659
    Top = 416
  end
  object MSResponsavel: TMontaSelect [48]
    Template.IdConsulta = 0
    Caption = 'Seleciona os Responsáveis cadastrados'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Responsável')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'RESPONSAVEL')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'RESPONSAVEL.FLGATIVOFIXO=1'
      'RESPONSAVEL.IDRESPONSAVEL=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 712
    Top = 24
  end
end
