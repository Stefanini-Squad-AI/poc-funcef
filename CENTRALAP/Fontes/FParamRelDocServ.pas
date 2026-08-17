(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 14/09/2000 
*******************************************************************************)

unit FParamRelDocServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, checklst, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,UDataBase;

type
  TfrmParamRelDocServ = class(TfrmOkCancelar)
    GroupBox2: TGroupBox;
    chklstPatro: TCheckListBox;
    bbtnPatroTodas: TBitBtn;
    bbtnPatroInverte: TBitBtn;
    GroupBox1: TGroupBox;
    bbtnPlanoTodas: TBitBtn;
    bbtnPlanoInverte: TBitBtn;
    chklstPlano: TCheckListBox;
    GroupBox3: TGroupBox;
    chklstServ: TCheckListBox;
    bbtnServTodas: TBitBtn;
    bbtnServInverte: TBitBtn;
    GroupBox4: TGroupBox;
    chklstSit: TCheckListBox;
    bbtnSitTodas: TBitBtn;
    bbtnSitInverte: TBitBtn;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryServ: TwwQuery;
    qrySit: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnPatroTodasClick(Sender: TObject);
    procedure bbtnPlanoTodasClick(Sender: TObject);
    procedure bbtnServTodasClick(Sender: TObject);
    procedure bbtnSitTodasClick(Sender: TObject);
    procedure bbtnPatroInverteClick(Sender: TObject);
    procedure bbtnPlanoInverteClick(Sender: TObject);
    procedure bbtnServInverteClick(Sender: TObject);
    procedure bbtnSitInverteClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
              Lista: TStringList; Chave, Descricao:String);
  end;


var
  frmParamRelDocServ: TfrmParamRelDocServ;
  LstPatro, LstPlano, LstServ, LstSit:TStringList;
  sPatro,sPlano,sServ,sSit, ssql:String;

implementation

uses dRelCentralAP, UMensErro;

{$R *.DFM}

procedure TfrmParamRelDocServ.FormShow(Sender: TObject);
begin
  inherited;

  LstPatro    :=TStringList.Create;
  LstPlano    :=TStringList.Create;
  LstServ     :=TStringList.Create;
  LstSit      :=TStringList.Create;

// Preencher chkList da Patrocinadora
   qryPatro.Close;
   qryPatro.Open;
   CriaLista(ChkLstPatro,QryPatro,LstPatro,'IDPESSOA','NOME');

// Preencher chkList da Plano
   qryPlano.Close;
   qryPlano.Open;
   CriaLista(ChkLstPlano,QryPlano,LstPlano,'IDPLANOPREV','NOME');

// Preencher chkList do Serviço
   qryServ.Close;
   qryServ.Open;
   CriaLista(ChkLstServ,QryServ,LstServ,'IDSERVICOS','NOME');

// Preencher chkList da Situação
   qrySit.Close;
   qrySit.Open;
   CriaLista(ChkLstSit,QrySit,LstSit,'IDSITBENEF','DESCRICAO');

end;

procedure TfrmParamRelDocServ.bbtnPatroTodasClick(Sender: TObject);
var i:integer;
begin
  inherited;
  for i := 0 to chklstPatro.Items.Count - 1 do
      chklstPatro.checked[i]:=True;
end;

procedure TfrmParamRelDocServ.bbtnPlanoTodasClick(Sender: TObject);
var i:integer;
begin
  inherited;
  for i := 0 to chklstPlano.Items.Count - 1 do
      chklstPlano.checked[i]:=True;
end;

procedure TfrmParamRelDocServ.bbtnServTodasClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstServ.Items.Count - 1 do
    chklstServ.checked[i]:=True;
end;

procedure TfrmParamRelDocServ.bbtnSitTodasClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstSit.Items.Count - 1 do
    chklstSit.checked[i]:=True;
end;

procedure TfrmParamRelDocServ.bbtnPatroInverteClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstPatro.Items.Count - 1 do
      chklstPatro.Checked[i] := Not chklstPatro.Checked[i];
end;

procedure TfrmParamRelDocServ.bbtnPlanoInverteClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstPlano.Items.Count - 1 do
     chklstPlano.Checked[i] := Not chklstPlano.Checked[i];
end;

procedure TfrmParamRelDocServ.bbtnServInverteClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstServ.Items.Count - 1 do
      chklstServ.Checked[i] := Not chklstServ.Checked[i];
end;

procedure TfrmParamRelDocServ.bbtnSitInverteClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstSit.Items.Count - 1 do
     chklstSit.Checked[i] := Not chklstSit.Checked[i];
end;

procedure TfrmParamRelDocServ.bbtnConfirmarClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  sPatro:='';
  sPlano:='';
  sServ:='';
  sSit:='';

  For i := 0 To ChkLstPatro.Items.Count - 1 Do
      begin
        if ChkLstPatro.Checked[I] = True Then
           sPatro := sPatro + LstPatro.Strings[I]+',';
      end;
  For i := 0 To ChkLstPlano.Items.Count - 1 Do
      begin
        if ChkLstPlano.Checked[I] = True Then
           sPlano := sPlano + LstPlano.Strings[I]+',';
       end;
  For i := 0 To ChkLstServ.Items.Count - 1 Do
      begin
        if ChkLstServ.Checked[I] = True Then
           sServ := sServ + LstServ.Strings[I]+',';
      end;
  For i := 0 To ChkLstSit.Items.Count - 1 Do
      begin
        if ChkLstSit.Checked[I] = True Then
           sSit := sSit + LstSit.Strings[I]+',';
      end;

  sPatro := Trim(Copy(sPatro,1,((Length(sPatro)-1))));
  sPlano := Trim(Copy(sPlano,1,((Length(sPlano)-1))));
  sServ := Trim(Copy(sServ,1,((Length(sServ)-1))));
  sSit := Trim(Copy(sSit,1,((Length(sSit)-1))));


   ssql:= 'SELECT                                    '+
          'P.NOME AS PATRO,                          '+
          'PP.NOME AS PLANO,                         '+
          'B.NOME AS SERVICOS,                       '+
          'ST.DESCRICAO AS SITUACAO,                 '+
          'DC.NOMEDOCUMENTO AS DOCUMENTO             '+
          'FROM                                      '+
          'TIPODOCXBENEF TB,                         '+
          'DOCUMENTOS DC,                            '+
          'SITBENEF ST,                              '+
          'PESSOA P,                                 '+
          'PLANPREV PP,                              '+
          'SERVICO B                                 '+
          'WHERE (TB.IDDOCUMENTO = DC.IDDOCUMENTO(+)) ';
          if (sPatro <> '') then
             ssql := ssql + 'AND (TB.IDPESSOA IN ('+sPatro+')) ';
          if (sPlano <> '') then
             ssql := ssql + 'AND   (TB.IDPLANOPREV IN ('+sPlano+'))  ';
          if (sServ <> '') then
             ssql := ssql + 'AND   (TB.IDBENEFICIO IN ('+sServ+'))     ';
          if (sSit <> '') then
             ssql := ssql + 'AND   (TB.IDSITBENEF IN ('+sSit+'))       ';

          ssql := ssql + 'AND   (TB.IDSITBENEF = ST.IDSITBENEF(+))  '+
          'AND   (TB.IDBENEFICIO = B.IDSERVICOS(+))  '+
          'AND   (TB.IDBENEFICIO IN (SELECT IDSERVICOS FROM SERVICO))'+
          'AND   (PP.IDPLANOPREV = TB.IDPLANOPREV)   '+
          'AND   (P.IDPESSOA = TB.IDPESSOA)          '+
          'ORDER BY P.NOME ,                         '+
          'PP.NOME ,                                 '+
          'B.NOME,                                   '+
          'ST.DESCRICAO                              ';

   Fazquery(dtmRelCentralAP.qryServicos,ssql);
end;

Procedure TfrmParamRelDocServ.CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                   Lista: TStringList; Chave, Descricao:String);
Begin
  Lista.Clear;
  While Not Query.Eof Do Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Query.Next;
  End;
End;

procedure TfrmParamRelDocServ.bbtnCancelarClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstPatro.Items.Count - 1 do
      chklstPatro.checked[i]:=False;
  for i := 0 to chklstPlano.Items.Count - 1 do
      chklstPlano.checked[i]:=False;
  for i := 0 to chklstServ.Items.Count - 1 do
      chklstServ.checked[i]:=False;
  for i := 0 to chklstSit.Items.Count - 1 do
      chklstSit.checked[i]:=False;

end;

end.

