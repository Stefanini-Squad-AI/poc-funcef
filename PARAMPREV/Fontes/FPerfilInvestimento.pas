// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

// Autor(a)   : Rodrigo Ramos
// Data       : 29/09/2017
// SIG        : 55755
// Descricao  : Criação do FORM FPerfilInvestimento
//------------------------------------------------------------------------------

unit FPerfilInvestimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook, Mask, wwdbedit,
  CheckLst, DBCtrls, ComCtrls, UDataBase,UMensErro, uCmtypes;

type
  TFrmPerfilInvestimento = class(TfrmCadastroCS)
    DBNome: TwwDBEdit;
    DBDescricao: TwwDBEdit;
    Nome: TLabel;
    Label2: TLabel;
    dblcPlanoContab: TwwDBLookupCombo;
    lblPlanoContab: TLabel;
    dblcPlano: TwwDBLookupCombo;
    lblPlano: TLabel;
    GBSitpart: TGroupBox;
    ChLBSitPart: TCheckListBox;
    PGEvento: TPageControl;
    TSEvento: TTabSheet;
    ChLBEvento: TCheckListBox;
    DBPadINSS: TDBCheckBox;
    DBativo: TDBCheckBox;
    qryPlanPrev: TwwQuery;
    qryPlaContab: TwwQuery;
    qrySitPart: TwwQuery;
    qryEvento: TwwQuery;
    qryNOME: TStringField;
    qryDESCRICAO: TStringField;
    qryIDPLANOPREV: TFloatField;
    qryPLANPREV2: TStringField;
    qryIDPLANPREVCONTAB: TFloatField;
    qryPLANCONTABIL: TStringField;
    qryIDPERFILINVEST: TFloatField;
    qryFLGATIVO: TFloatField;
    qryFLGPADRAOINSS: TFloatField;
    qryDetSitpart: TwwQuery;
    updSitPart: TUpdateSQL;
    qryDetEvento: TwwQuery;
    updEvento: TUpdateSQL;
    qryVerificaINSS: TwwQuery;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
     Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
            Lista: TStringList; Chave, Descricao,checado:String);
    procedure FormDestroy(Sender: TObject);
    procedure AbreListas(idperfil:Integer);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure ChLBSitPartClick(Sender: TObject);
    procedure ChLBEventoClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
     iSeqIdPerfil : integer;
     function VerificaFlagINSS : boolean;
  public
    { Public declarations }
  end;

var
  FrmPerfilInvestimento: TFrmPerfilInvestimento;
  slSitPart, slEvento: TStringList;

implementation


{$R *.DFM}

procedure TFrmPerfilInvestimento.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if montaselect.RetornouValor then
  begin
    iSeqIdPerfil := strtoint(MontaSelect.ValoresChave[0]);
    AbreListas(iSeqIdPerfil);
  end;

end;

procedure TFrmPerfilInvestimento.FormCreate(Sender: TObject);
begin
  inherited;
    qry.close;
    qry.parambyname('IDPERFILINVEST').asinteger := -1;
    qry.open;

   qryPlanPrev.Open;
   qryPlaContab.Open;
   slSitpart := TStringList.Create;
   slEvento := TStringList.Create;

  
end;


Procedure TFrmPerfilInvestimento.CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                           Lista: TStringList; Chave, Descricao, checado:String);
var
i : Integer;

Begin
  Lista.Clear;
  i := 0;
  While Not Query.Eof Do
  Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    ChkList.Checked[i] := Query.FieldByName(checado).AsString = 'S';
    Query.Next;
    inc(i);
  End;
End;


procedure TFrmPerfilInvestimento.FormDestroy(Sender: TObject);
begin
  inherited;
  Freeandnil(slSitPart);
  Freeandnil(slEvento);
end;

procedure TFrmPerfilInvestimento.AbreListas(idperfil: Integer);
begin
    qry.close;
    qry.parambyname('IDPERFILINVEST').asinteger := idperfil;
    qry.open;

    qrySitPart.close;
    qrySitPart.parambyname('idperfil').asinteger := idperfil;
    qrySitPart.open;

    qryDetSitPart.close;
    qryDetSitPart.parambyname('idperfil').asinteger := idperfil;
    qryDetSitPart.open;

    qryEvento.close;
    qryEvento.parambyname('idperfil').asinteger := idperfil;
    qryEvento.open;

    qryDetEvento.close;
    qryDetEvento.parambyname('idperfil').asinteger := idperfil;
    qryDetEvento.open;

    CriaLista( ChLBSitPart,qrySitPart,slSitPart,'IDSITPART','DESCRICAO','MARCADO');
    CriaLista( ChLBEvento,qryEvento,slEvento,'IDEVENTOGERADOR','NOME','MARCADO');
end;

procedure TFrmPerfilInvestimento.CmeCadastroInsert(Sender: TObject);
begin
    Abrelistas(-1);
  inherited;

   iSeqIdPerfil := LeUltRegistro(nil, 'PERFILINVEST');
   qry.FieldByName('IDPERFILINVEST').AsInteger  := iSeqIdPerfil;
   qry.FieldByName('FLGATIVO').AsInteger        := 1;
   DBativo.Checked := true;

end;

procedure TFrmPerfilInvestimento.ChLBSitPartClick(Sender: TObject);
var
  index : integer;
begin
  inherited;

  if qry.State in ([dsInsert, dsEdit]) then
  begin
    index := ChLBSitPart.itemindex;

    if ChLBSitPart.Checked[index] then
    begin
      {insert na tabela}
      qryDetSitPart.insert;
      qryDetSitPart.FieldByName('IDPERFILINVEST').AsInteger := iSeqIdPerfil;
      qryDetSitPart.FieldByName('IDSITPART').AsString       := slSitPart.Strings[index];
      qryDetSitPart.post;
    end
    else
    begin
      {apaga da tabela}
      if qryDetSitPart.locate('IDSITPART', slSitPart.Strings[index], []) then
         qryDetSitPart.delete;
    end;
  end;
end;

procedure TFrmPerfilInvestimento.ChLBEventoClick(Sender: TObject);
var
  index : integer;
begin
  inherited;

  if qry.State in ([dsInsert, dsEdit]) then
  begin
    index := ChLBEvento.itemindex;

    if ChLBEvento.Checked[index] then
    begin
      {insert na tabela}
      qryDetEvento.insert;
      qryDetEvento.FieldByName('IDPERFILINVEST').AsInteger := iSeqIdPerfil;
      qryDetEvento.FieldByName('IDEVENTOGERADOR').AsString := slEvento.Strings[index];
      qryDetEvento.post;
    end
    else
    begin
      {apaga da tabela}
      if qryDetEvento.locate('IDEVENTOGERADOR', slEvento.Strings[index], []) then
         qryDetEvento.delete;
    end;
  end;
end;


procedure TFrmPerfilInvestimento.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  qryDetSitPart.CancelUpdates;
  qryDetEvento.CancelUpdates;
  if CmeCadastro.Operacao = opInserir then
  begin
    ChLBSitPart .clear;
    ChLBEvento .clear;
  end;
end;

procedure TFrmPerfilInvestimento.CmeCadastroConfirma(Sender: TObject);
var
  i:integer;
  flg:Boolean;
begin
  if CmeCadastro.Operacao = opApagar then
  begin
    AplicaAlteracoes([qryDetSitPart]);
    AplicaAlteracoes([qryDetEvento]);
  end;

  //===============================================================================================================
  if cmeCadastro.Operacao <> opApagar then
  begin
     if  DBNome.text = EmptyStr then  //Campo Nome - Obrigatório    1
     begin
        MsgDlg('É obrigatório informar o Nome.','Error',mtError,[mbok],0);
        abort;
     end;
    //===============================================================================================================
     if  DBDescricao.text = EmptyStr then    //Campo Descrição - Obrigatório   2
     begin
        MsgDlg('É obrigatório informar a Descrição.','Error',mtError,[mbok],0);
        abort;
     end;
    //===============================================================================================================
     if  dblcPlano.text = EmptyStr then    // Plano Previdenciário - Obrigatório    3
     begin
        MsgDlg('É obrigatório informar o Plano Previdenciário.','Error',mtError,[mbok],0);
        abort;
     end;
    //===============================================================================================================
     if  dblcPlanoContab.text = EmptyStr then   // Plano Contábil  - Obrigatório.   4
     begin
        MsgDlg('É obrigatório informar o Plano Contábil.','Error',mtError,[mbok],0);
        abort;
     end;
    //===============================================================================================================
    if DBPadINSS.checked then
    begin
        if  VerificaFlagINSS() then   // Padrão INSS  - Deve haver somente um cadastro com o Padrão INSS marcado.     5
        begin
          MsgDlg('Não é permitido mais de um cadastro com o Padrão INSS marcado.','Error',mtError,[mbok],0);
          abort;
        end;
    end;
  //===============================================================================================================
    flg := false;
    for i:=0 to (ChLBEvento.Items.count - 1) do
    begin
     if ChLBEvento.checked[i] then
     begin
       flg := true;
       break;
     end;
    end;

    if not (flg) then
    begin
        MsgDlg('É obrigatório a seleção de pelo menos um Evento.','Error',mtError,[mbok],0);
        abort;
    end;
  end;
  //===============================================================================================================
  try
   inherited;
  except
    raise;
  end;


  if cmeCadastro.Operacao <> opApagar then
  begin
    AplicaAlteracoes([qryDetSitPart]);
    AplicaAlteracoes([qryDetEvento]);
  end;
end;

procedure TFrmPerfilInvestimento.CmeCadastroDelete(Sender: TObject);
begin
  while not qryDetSitPart.eof do
      qryDetSitPart.delete;

  while not qryDetEvento.eof do
      qryDetEvento.delete;

  inherited;

end;

procedure TFrmPerfilInvestimento.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  
  if CmeCadastro.Operacao = opVazio then
  begin
    ChLBSitPart .clear;
    ChLBEvento .clear;
  end;

end;


function TFrmPerfilInvestimento.VerificaFlagINSS: boolean;
begin
  qryVerificaINSS.close;
  qryVerificaINSS.SQL.Clear;
  qryVerificaINSS.SQL.Add('SELECT FLGPADRAOINSS     ');
  qryVerificaINSS.SQL.Add('  FROM PERFILINVEST PI   ');
  qryVerificaINSS.SQL.Add(' WHERE FLGPADRAOINSS = 1 ');
  qryVerificaINSS.SQL.Add('   AND IDPLANOPREV = '+qry.FieldbyName('IDPLANOPREV').AsString );
  if cmeCadastro.Operacao = opAlterar then
     qryVerificaINSS.SQL.Add('   AND IDPERFILINVEST <> '+qry.FieldbyName('IDPERFILINVEST').AsString );

  qryVerificaINSS.open;

  result := not qryVerificaINSS.isEmpty;
end;

end.


