unit FParamrelRubFontePag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, fAguarde, usistema, dbasedados;

type
  TfrmParamrelRubFontePag = class(TfrmOkCancelar)
    qryFontePag: TwwQuery;
    GroupBox2: TGroupBox;
    CboFontePagadora: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure MontaQuery;

  public
    { Public declarations }
  end;

var
  frmParamrelRubFontePag: TfrmParamrelRubFontePag;

implementation

Uses DRelGeral, uObjFolha;

{$R *.DFM}

procedure TfrmParamrelRubFontePag.FormShow(Sender: TObject);
begin
  inherited;

  { Abre a query }
  QryFontePag.Open;

  { Ler enquanto não for o fim da query }
  While Not QryFontePag.Eof Do Begin

    { Adiciona ao componente "CboFontePagadora", a descrição da Patrocinadora }
    CboFontePagadora.Items.Add(QryFontePag.FieldByName('DESCRICAO').AsString);
    QryFontePag.Next;
  End;
end;

procedure TfrmParamrelRubFontePag.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  frmAguarde.Mostra('Aguarde... Montando Relatório.');

  { Monta a query, para testar em um registro da paramfolha se usa código externo ou interno }
  MontaQuery; 

  dtmRelGeral.qryFundacao.Close;
  dtmRelGeral.qryFundacao.ParamByName('PFUNDACAO').AsInteger := Sistema.IdEmpresa;
  dtmRelGeral.qryFundacao.Open;

  frmAguarde.Apaga;
end;

procedure TfrmParamrelRubFontePag.MontaQuery;
Begin
  dtmRelGeral.qryFontePagadora.Close;
  dtmRelGeral.qryFontePagadora.Sql.Clear;

  If SistemaFolha.FlgUsaCodRubExt = 0 Then
    dtmRelGeral.qryFontePagadora.Sql.Add(' SELECT FON.DESCRICAO AS DESCFONTE, '+
                                         ' PRV.IDPROVENTO AS CODIGO, '+
                                         ' PRV.DESCRICAO AS DESCRUB '+
                                         ' FROM PROVDESC PRV, FONTEPAGADORA FON ')
  Else
    dtmRelGeral.qryFontePagadora.Sql.Add(' SELECT FON.DESCRICAO AS DESCFONTE, '+
                                         ' PRV.CODPROVDESC AS CODIGO, '+
                                         ' PRV.DESCRPROVDESC AS DESCRUB '+
                                         ' FROM PROVDESC PRV, FONTEPAGADORA FON ');

  dtmRelGeral.qryFontePagadora.Sql.Add(' WHERE PRV.CODFONTEPAGADORA = FON.IDFONTEPAGADORA ');

  If (Trim(CboFontePagadora.Text) <> '') Then
  Begin
    qryFontePag.Locate('DESCRICAO',CboFontePagadora.Text,[]);
    dtmRelGeral.qryFontePagadora.Sql.Add(
    ' AND FON.IDFONTEPAGADORA = '+qryFontePag.FieldByName('IDFONTEPAGADORA').AsString);
  End;

  dtmRelGeral.qryFontePagadora.Sql.Add(' ORDER BY FON.DESCRICAO, CODIGO ');
  dtmRelGeral.qryFontePagadora.Open;
End;

end.
{==============================================================================|
| UNIT: FPARAMRELRUBFONTEPAG                                                   |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   - FORMULÁRIO FILTRO PARA O RELATÓRIO DE RUBRICAS POR FONTE PAGADORA        |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/12/2002 A 02/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Foi criada uma procedure MontaQuery para testar se usa código interno   |
|    ou externo.                                                               |
|                                                                              |
|------------------------------------------------------------------------------}

