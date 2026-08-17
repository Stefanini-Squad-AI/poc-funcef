(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 14/09/2000
*******************************************************************************)

unit FParamRelDocBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, checklst, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,UDataBase;

type
  TfrmParamRelDocBenef = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    bbtnBenefTodas: TBitBtn;
    bbtnBenefInverte: TBitBtn;
    chklstPatro: TCheckListBox;
    bbtnPatroTodas: TBitBtn;
    bbtnPatroInverte: TBitBtn;
    GroupBox3: TGroupBox;
    chklstPlano: TCheckListBox;
    bbtnPlanoTodas: TBitBtn;
    bbtnPlanoInverte: TBitBtn;
    chklstBenef: TCheckListBox;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryBenef: TwwQuery;
    GroupBox2: TGroupBox;
    chklstSit: TCheckListBox;
    qrySit: TwwQuery;
    bbtnSitInverte: TBitBtn;
    bbtnSitTodas: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure bbtnPatroTodasClick(Sender: TObject);
    procedure bbtnPlanoTodasClick(Sender: TObject);
    procedure bbtnBenefTodasClick(Sender: TObject);
    procedure bbtnPatroInverteClick(Sender: TObject);
    procedure bbtnPlanoInverteClick(Sender: TObject);
    procedure bbtnBenefInverteClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSitTodasClick(Sender: TObject);
    procedure bbtnSitInverteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelDocBenef: TfrmParamRelDocBenef;
  LstPatro, LstPlano, LstBenef, LstSit:TStringList;
  sPatro,sPlano,sBenef, sSit, ssql:String;

implementation

uses dRelCentralAP, FParamRelDocServ, UMensErro;

{$R *.DFM}

procedure TfrmParamRelDocBenef.FormShow(Sender: TObject);
begin
  inherited;
  LstPatro    :=TStringList.Create;
  LstPlano    :=TStringList.Create;
  LstBenef    :=TStringList.Create;
  LstSit      :=TStringList.Create;

// Preencher chkList da Patrocinadora
   qryPatro.Close;
   qryPatro.Open;
   frmParamRelDocServ.CriaLista(ChkLstPatro,QryPatro,LstPatro,'IDPESSOA','NOME');

// Preencher chkList da Plano
   qryPlano.Close;
   qryPlano.Open;
   frmParamRelDocServ.CriaLista(ChkLstPlano,QryPlano,LstPlano,'IDPLANOPREV','NOME');

// Preencher chkList do Benefício
   qryBenef.Close;
   qryBenef.Open;
   frmParamRelDocServ.CriaLista(ChkLstBenef,QryBenef,LstBenef,'IDBENEFICIO','NOME');

// Preencher chkList da Situação
   qrySit.Close;
   qrySit.Open;
   frmParamRelDocServ.CriaLista(ChkLstSit,QrySit,LstSit,'IDSITBENEF','DESCRICAO');

end;

procedure TfrmParamRelDocBenef.bbtnPatroTodasClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstPatro.Items.Count - 1 do
      chklstPatro.checked[i]:=True;
end;

procedure TfrmParamRelDocBenef.bbtnPlanoTodasClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstPlano.Items.Count - 1 do
      chklstPlano.checked[i]:=True;
end;

procedure TfrmParamRelDocBenef.bbtnBenefTodasClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstBenef.Items.Count - 1 do
      chklstBenef.checked[i]:=True;
end;

procedure TfrmParamRelDocBenef.bbtnPatroInverteClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstPatro.Items.Count - 1 do
      chklstPatro.Checked[i] := Not chklstPatro.Checked[i];
end;

procedure TfrmParamRelDocBenef.bbtnPlanoInverteClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstPlano.Items.Count - 1 do
      chklstPlano.Checked[i] := Not chklstPlano.Checked[i];
end;

procedure TfrmParamRelDocBenef.bbtnBenefInverteClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstBenef.Items.Count - 1 do
      chklstBenef.Checked[i] := Not chklstBenef.Checked[i];
end;

procedure TfrmParamRelDocBenef.bbtnConfirmarClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  sPatro:='';
  sPlano:='';
  sBenef:='';
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
  For i := 0 To ChkLstBenef.Items.Count - 1 Do
      begin
        if ChkLstbenef.Checked[I] = True Then
           sBenef := sBenef + LstBenef.Strings[I]+',';
      end;

  For i := 0 To ChkLstSit.Items.Count - 1 Do
      begin
        if ChkLstSit.Checked[I] = True Then
           sSit := sSit + LstSit.Strings[I]+',';
      end;

  sPatro := Trim(Copy(sPatro,1,((Length(sPatro)-1))));
  sPlano := Trim(Copy(sPlano,1,((Length(sPlano)-1))));
  sBenef := Trim(Copy(sBenef,1,((Length(sBenef)-1))));
  sSit   := Trim(Copy(sSit,1,((Length(sSit)-1))));

  ssql:= 'SELECT                                    '+
         'P.NOME AS PATRO,                          '+
         'PP.NOME AS PLANO,                         '+
         'B.NOME AS BENEFICIO,                      '+
         'ST.DESCRICAO AS SITUACAO,                 '+
         'DC. NOMEDOCUMENTO AS DOCUMENTO            '+
         'FROM                                      '+
         'TIPODOCXBENEF TB,                         '+
         'DOCUMENTOS DC,                            '+
         'SITBENEF ST,                              '+
         'PESSOA P,                                 '+
         'PLANPREV PP,                              '+
         'BENEFICIO B                               '+
         'WHERE TB.IDDOCUMENTO = DC.IDDOCUMENTO     ';
         if (sPatro <> '') then
            ssql := ssql + 'AND (TB.IDPESSOA IN ('+sPatro+')) ';
         if (sPlano <> '') then
            ssql := ssql + 'AND   (TB.IDPLANOPREV IN ('+sPlano+'))  ';
         if (sBenef <> '') then
            ssql := ssql + 'AND   (TB.IDBENEFICIO IN ('+sBenef+'))     ';
         if (sSit <> '') then
             ssql := ssql + 'AND   (TB.IDSITBENEF IN ('+sSit+'))       ';

         ssql := ssql + 'AND   (ST.IDSITBENEF = TB.IDSITBENEF)  '+
         'AND   (B.IDBENEFICIO = TB.IDBENEFICIO)      '+
         'AND   (TB.IDBENEFICIO IN (SELECT IDBENEFICIO FROM BENEFICIO))'+
         'AND   (PP.IDPLANOPREV = TB.IDPLANOPREV)     '+
         'AND   (P.IDPESSOA = TB.IDPESSOA)            '+
         'ORDER BY P.NOME ,                         '+
         'PP.NOME ,                                 '+
         'B.NOME,                                   '+
         'ST.DESCRICAO                              ';

         Fazquery(dtmRelCentralAP.qryRUB,ssql);

end;

procedure TfrmParamRelDocBenef.bbtnCancelarClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstPatro.Items.Count - 1 do
      chklstPatro.checked[i]:=False;
  for i := 0 to chklstPlano.Items.Count - 1 do
      chklstPlano.checked[i]:=False;
  for i := 0 to chklstBenef.Items.Count - 1 do
      chklstBenef.checked[i]:=False;

end;

procedure TfrmParamRelDocBenef.bbtnSitTodasClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstSit.Items.Count - 1 do
      chklstSit.checked[i]:=True;
end;

procedure TfrmParamRelDocBenef.bbtnSitInverteClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  for i := 0 to chklstSit.Items.Count - 1 do
      chklstSit.Checked[i] := Not chklstSit.Checked[i];
end;

end.

