inherited frmBrwPess: TfrmBrwPess
  Left = 99
  Top = 130
  Caption = 'Visão Geral do Cadastro de Pessoal'
  Constraints.MinHeight = 392
  Constraints.MinWidth = 622
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnSelecao: TPanel
      BevelInner = bvRaised
      BevelOuter = bvNone
      inherited pgctrlPrincipal: TPageControl [0]
      end
      inherited pnResult: TPanel [1]
        BevelOuter = bvNone
        object dbgrPessoal: TwwDBGrid
          Left = 0
          Top = 0
          Width = 604
          Height = 323
          Selected.Strings = (
            'MATRICULA'#9'13'#9'Matrícula'
            'IDPESSOA'#9'10'#9'Id.Pessoa'
            'NOME'#9'60'#9'Nome'
            'NUMDOCUMENTO'#9'18'#9'CPF'
            'SEXO'#9'1'#9'Sexo'
            'DATANASC'#9'10'#9'Data Nasc.'
            'ESTCIVIL'#9'1'#9'Est.Civil')
          IniAttributes.Delimiter = ';;'
          TitleColor = clGray
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsPrincipal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWhite
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icYellow
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 243
  end
  inherited sqlPrincipal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  P.NOME, P.RAZAOSOCIAL, P.TIPO, P.NUMDOCUMENTO,'
      '  PF.*, CI.NOME AS CIDADE, EP.LOGRADOURO,'
      '  EP.LOGRADOURO, EP.CODESTADO, EP.NUMERO,'
      '  EP.COMPLEMENTO, EP.BAIRRO, EP.CEP, CA.TITULO,'
      '  F.*, ST.*, HT.JORNADAMENSAL,'
      '  FP.IDRAMOFORNECEDOR, CC.NOME AS CENTROCUSTO'
      'FROM'
      '  PESSOA P, PESSOAFISICA PF, ENDPESS EP, CIDADES CI, CARGO CA,'
      
        '  FUNCIONARIO F, SITFUNC ST, HORATRAB HT, FILIALPESSOA FP, CENTC' +
        'UST CC'
      'WHERE'
      '  (F.IDPESSOA         = P.IDPESSOA) AND'
      '  (P.IDPESSOA         = PF.IDPESSOA) AND'
      '  (P.IDENDRESIDENCIAL = EP.IDENDERECO(+)) AND'
      '  (EP.IDCIDADES       = CI.IDCIDADES(+)) AND'
      '  (F.DATAADMISSAO    <= TO_DATE('#39'18/07/2002'#39','#39'dd/mm/yyyy'#39')) AND'
      '  (ST.TIPOSIT         = '#39'A'#39') AND'
      '  (F.TIPOCONTRATO     IN ('#39'E'#39','#39'S'#39')) AND'
      '  (F.IDESTAB          = FP.IDFILIALPESSOA(+)) AND'
      '  (F.IDSITFUNC        = ST.IDSITFUNC(+)) AND'
      '  (F.IDHORARIO        = HT.IDHORARIO(+)) AND'
      
        '  (DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = CA.IDCARGO(+))' +
        ' AND'
      '  (F.CODCENTROCUSTO   = CC.CODCENTROCUSTO(+)) AND'
      '  (F.IDEMPRESA        = CC.IDEMPRESA(+)) AND'
      '  (PF.SEXO           IN ('#39'M'#39','#39'F'#39')) AND'
      '  (PF.ESTCIVIL       IN ('#39'S'#39','#39'C'#39','#39'D'#39','#39'J'#39','#39'E'#39','#39'V'#39','#39'O'#39')) AND'
      '  (F.TIPOPAGAMENTO     IN ('#39'M'#39','#39'D'#39','#39'H'#39'))'
      'ORDER BY'
      '  UPPER(P.Nome)')
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'TIPO;NOME'
        Options = [ixCaseInsensitive]
      end>
  end
end
