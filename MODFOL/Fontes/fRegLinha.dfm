inherited frmRegLinha: TfrmRegLinha
  Left = 51
  Top = 189
  Caption = 'Linhas de Transporte por Empregado'
  ClientHeight = 321
  ClientWidth = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 700
    Height = 235
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 692
      Height = 34
      object Label1: TLabel
        Left = 7
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label10: TLabel
        Left = 162
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbtxtSituacao: TDBText
        Left = 568
        Top = 8
        Width = 113
        Height = 21
        Alignment = taCenter
        DataField = 'SITUACAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedMat: TwwDBEdit
        Left = 67
        Top = 7
        Width = 84
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 199
        Top = 7
        Width = 361
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 38
      Width = 692
      Height = 193
      Tabs.Strings = (
        'Linhas')
      inherited pgctrlDetalhe: TPageControl
        Width = 594
        Height = 134
        inherited tbsDet: TTabSheet
          Caption = 'Linhas'
          inherited dbgrdDet: TwwDBGrid
            Width = 586
            Height = 106
            Selected.Strings = (
              'QTDDIARIA'#9'10'#9'Qtde. Diária'#9'F'
              'TIPOLINHATRANSP'#9'20'#9'Tipo'#9'F'
              'DESCRICAO'#9'40'#9'Descrição'#9'F'
              'NUMLINHATRANSP'#9'10'#9'Referência'#9'F'
              'VLRLINHATRANSP'#9'10'#9'Valor'#9'F')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 586
            Height = 106
            object Label3: TLabel
              Left = 153
              Top = 5
              Width = 115
              Height = 13
              Caption = 'Linha de Transporte'
            end
            object Label5: TLabel
              Left = 153
              Top = 72
              Width = 103
              Height = 13
              Caption = 'Quantidade Diária'
            end
            object dblcLinhaTransp: TwwDBLookupCombo
              Left = 153
              Top = 24
              Width = 381
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'Descrição da Linha'
                'NUMLINHATRANSP'#9'5'#9'Número/Ref.'
                'TIPOLINHATRANSP'#9'15'#9'Tipo de Transporte'
                'VLRLINHATRANSP'#9'10'#9'Valor Unitário')
              DataField = 'IDLINHATRANSP'
              DataSource = dsDet
              LookupTable = qryLinhaTransp
              LookupField = 'IDLINHATRANSP'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblcLinhaTranspCloseUp
            end
            object wwDBSpinEdit1: TwwDBSpinEdit
              Left = 153
              Top = 90
              Width = 100
              Height = 21
              Increment = 1
              MaxValue = 9
              DataField = 'QTDDIARIA'
              DataSource = dsDet
              TabOrder = 1
              UnboundDataType = wwDefault
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 684
      end
      inherited Dock974: TDock97
        Left = 598
        Height = 134
      end
    end
  end
  inherited Dock972: TDock97
    Width = 700
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 282
    Width = 700
    inherited tb97Fundo: TToolbar97
      Left = 530
      DockPos = 538
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 363
      DockPos = 371
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  F.IDPESSOA, F.MATRICULA, ('#39'  '#39' || PF.NOME) AS NOME,'
      '  F.DATAADMISSAO, ST.TIPOSIT,'
      
        '  DECODE(ST.TIPOSIT,'#39'A'#39','#39'(Ativ'#39', '#39'F'#39','#39'(Afastad'#39', '#39'D'#39','#39'(Demitid'#39')' +
        ' ||'
      '    DECODE(PEFIS.SEXO,'#39'F'#39','#39'a)'#39','#39'o)'#39') AS SITUACAO'
      'FROM'
      '  PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F, SITFUNC ST'
      'WHERE'
      '  (F.IDPESSOA  = :IDPESSOA)      AND'
      '  (F.IDSITFUNC = ST.IDSITFUNC)   AND'
      '  (F.IDPESSOA  = PEFIS.IDPESSOA) AND'
      '  (F.IDPESSOA  = PF.IDPESSOA)'
      'ORDER BY'
      '  UPPER(NOME)')
    Left = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 583
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 251
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Linhas de Transporte por Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA'
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA'
      'EMPRESAPROP.IDPESSOA')
    Filtro.Strings = (
      'EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA'
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    Left = 349
  end
  inherited ds: TwwDataSource
    Left = 307
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LP.IDPESSOA, LP.IDLINHATRANSP, LP.QTDDIARIA,'
      
        '  LT.TIPOLINHATRANSP, LT.DESCRICAO, LT.NUMLINHATRANSP, LT.VLRLIN' +
        'HATRANSP'
      'FROM'
      '  LINHAXPESS LP, LINHATRANSP LT'
      'WHERE'
      '  (LP.IDPESSOA      = :IDPESSOA) AND'
      '  (LP.IDLINHATRANSP = LT.IDLINHATRANSP)')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 546
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDetQTDDIARIA: TFloatField
      DisplayLabel = 'Qtde. Diária'
      DisplayWidth = 10
      FieldName = 'QTDDIARIA'
      Origin = 'LINHAXPESS.QTDDIARIA'
    end
    object qryDetTIPOLINHATRANSP: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 20
      FieldName = 'TIPOLINHATRANSP'
      Origin = 'LINHATRANSP.TIPOLINHATRANSP'
      Size = 15
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'LINHATRANSP.DESCRICAO'
      Size = 40
    end
    object qryDetNUMLINHATRANSP: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 10
      FieldName = 'NUMLINHATRANSP'
      Origin = 'LINHATRANSP.NUMLINHATRANSP'
      Size = 5
    end
    object qryDetVLRLINHATRANSP: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRLINHATRANSP'
      Origin = 'LINHATRANSP.VLRLINHATRANSP'
      DisplayFormat = '0.00'
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LINHAXPESS.IDPESSOA'
      Visible = False
    end
    object qryDetIDLINHATRANSP: TFloatField
      FieldName = 'IDLINHATRANSP'
      Origin = 'LINHAXPESS.IDLINHATRANSP'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update LINHAXPESS'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDLINHATRANSP = :IDLINHATRANSP,'
      '  QTDDIARIA = :QTDDIARIA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDLINHATRANSP = :OLD_IDLINHATRANSP')
    InsertSQL.Strings = (
      'insert into LINHAXPESS'
      '  (IDPESSOA, IDLINHATRANSP, QTDDIARIA)'
      'values'
      '  (:IDPESSOA, :IDLINHATRANSP, :QTDDIARIA)')
    DeleteSQL.Strings = (
      'delete from LINHAXPESS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDLINHATRANSP = :OLD_IDLINHATRANSP')
    Left = 510
    Top = 9
  end
  object qryLinhaTransp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDLINHATRANSP,'
      '  DESCRICAO, NUMLINHATRANSP, VLRLINHATRANSP,'
      '  TIPOLINHATRANSP'
      'FROM'
      '  LINHATRANSP')
    ValidateWithMask = True
    Left = 442
    Top = 7
  end
  object qryRadInst: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RI.IDPROCESSO, RI.IDPESSRESP'
      'FROM    RADINSTPROCESSO RI, RADTIPOPROCESSO RT'
      'WHERE  RI.IDPESSRESP = :IDPESSRESP'
      'AND   RT.IDREFERENCIA = 23'
      'AND   RI.FLGOK <> '#39'S'#39
      'AND   RI.IDTIPOPROCESSO = RT.IDTIPOPROCESSO')
    ValidateWithMask = True
    Left = 200
    Top = 118
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSRESP'
        ParamType = ptUnknown
      end>
  end
end
