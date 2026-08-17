inherited frmCadResponsa: TfrmCadResponsa
  Left = 121
  Top = 169
  HelpContext = 120012
  Caption = 'Responsavel'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 54
      Height = 390
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
        Height = 331
        ActivePage = TabSheet1
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Height = 303
          end
          inherited PnlDocumentos_Padrao: TPanel
            Height = 303
            inherited pnlItemsDoc: TPanel
              Height = 301
            end
            inherited pnlFoto: TPanel
              Height = 301
              inherited Bevel1: TBevel
                Height = 270
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 270
                inherited btnAssociarimgPessoa: TButton
                  Left = 520
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Height = 270
                inherited imgPessoa: TDBImage
                  Left = 520
                end
              end
            end
            inherited lstDocumentos: TListView
              Height = 301
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Height = 303
            inherited grpTipoEnd: TGroupBox
              Height = 303
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Height = 303
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Height = 303
          end
          inherited Panel1: TPanel
            Height = 303
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Height = 303
          end
          inherited dbgContato: TwwDBGrid
            Height = 303
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Responsável'
          object plnRespon: TPanel
            Left = 136
            Top = 32
            Width = 401
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
              DataSource = dsRespon
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object chkContrato: TDBCheckBox
              Left = 16
              Top = 88
              Width = 241
              Height = 17
              Caption = 'Responsável pelo Contrato'
              DataField = 'FLGCONTRATO'
              DataSource = dsRespon
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object chkProjeto: TDBCheckBox
              Left = 16
              Top = 120
              Width = 233
              Height = 17
              Caption = 'Responsável pelo Projeto'
              DataField = 'FLGPROJETO'
              DataSource = dsRespon
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object plnCapBem: TPanel
              Left = 2
              Top = 2
              Width = 397
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
        Height = 331
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
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 120012
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Responsável')
    Tabelas.Strings = (
      'RESPONSAVEL'
      'PESSOA')
    CamposChave.Strings = (
      'RESPONSAVEL.IDRESPONSAVEL')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 244
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
  inherited updPessoaFisica: TUpdateSQL
    Left = 425
  end
  inherited qryPessoaFisica: TwwQuery
    Left = 551
    Top = 133
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
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 129
    Top = 326
  end
  inherited qryTipoDoc: TwwQuery
    Left = 659
    Top = 416
  end
  object qryRespon: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '          IDRESPONSAVEL, '
      '          FLGATIVOFIXO,'
      '          FLGCONTRATO,'
      '          FLGPROJETO,'
      '          FLGTPRESPONSAVEL          '
      'FROM '
      '         RESPONSAVEL'
      'WHERE  '
      '       (IDRESPONSAVEL = :IDPESSOA) '
      ''
      '')
    UpdateObject = updRespon
    PictureMasks.Strings = (
      'NOMEGRUPO'#9'*@'#9'T'#9'F')
    ValidateWithMask = True
    Left = 325
    Top = 419
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryResponIDRESPONSAVEL: TFloatField
      Alignment = taCenter
      FieldName = 'IDRESPONSAVEL'
      Origin = 'RESPONSAVEL.IDRESPONSAVEL'
    end
    object qryResponFLGATIVOFIXO: TFloatField
      Alignment = taCenter
      FieldName = 'FLGATIVOFIXO'
      Origin = 'RESPONSAVEL.FLGATIVOFIXO'
    end
    object qryResponFLGCONTRATO: TFloatField
      Alignment = taCenter
      FieldName = 'FLGCONTRATO'
      Origin = 'RESPONSAVEL.FLGCONTRATO'
    end
    object qryResponFLGPROJETO: TFloatField
      Alignment = taCenter
      FieldName = 'FLGPROJETO'
      Origin = 'RESPONSAVEL.FLGPROJETO'
    end
  end
  object updRespon: TUpdateSQL
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
    Left = 377
    Top = 417
  end
  object dsRespon: TwwDataSource
    AutoEdit = False
    DataSet = qryRespon
    Left = 428
    Top = 417
  end
end
