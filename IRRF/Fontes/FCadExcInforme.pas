unit FCadExcInforme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdblook, CMDBLookupCombo, Mask, wwdbedit, CmEventosCadastro,
  ImgList;

type
  TfrmCadExcInforme = class(TfrmCadastroCS)
    dblcRubPrinc: TCMDBLookupCombo;
    qryRubricaPrin: TwwQuery;
    lblRubPrin: TLabel;
    Label1: TLabel;
    dblcRubrica: TCMDBLookupCombo;
    qryLinhaInforme: TwwQuery;
    qryLinhaInformeNOMEINFORME: TStringField;
    qryLinhaInformeIDINFORME: TFloatField;
    Label2: TLabel;
    dblcLinhaInforme: TwwDBLookupCombo;
    lblPrioridade: TLabel;
    dbedPrioridade: TwwDBEdit;
    qryIDRUBRICAPRIN: TFloatField;
    qryIDINFORME: TFloatField;
    qryPRIORIDADE: TFloatField;
    qryIDRUBRICA: TFloatField;
    qryRubrica: TwwQuery;
    qryLinhaInformeCODINFORME: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadExcInforme: TfrmCadExcInforme;

implementation

{$R *.DFM}

Uses uMensErro;


procedure TfrmCadExcInforme.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDRUBRICAPRIN').AsInteger := -1;
  qry.ParamByName('IDRUBRICA').AsInteger     := -1;
  qry.Open;
end;

procedure TfrmCadExcInforme.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(dblcRubPrinc.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Rubrica Principal','Aviso',mtWarning,[mbOK],0);
     dblcRubPrinc.SetFocus;
     exit;
  end;
  if trim(dblcRubrica.Text) = '' then begin
     MsgDlg('Obrigatório escolher uma Rubrica','Aviso',mtWarning,[mbOK],0);
     dblcRubrica.SetFocus;
     exit;
  end;
  if trim(dblcLinhaInforme.Text) = '' then begin
     MsgDlg('Obrigatório escolher uma linha para o Informe','Aviso',mtWarning,[mbOK],0);
     dblcLinhaInforme.SetFocus;
     exit;
  end;
  if trim(dbedPrioridade.Text) = '' then begin
     MsgDlg('Obrigatório escolher uma prioridade','Aviso',mtWarning,[mbOK],0);
     dbedPrioridade.SetFocus;
     exit;
  end;
  inherited;
end;

procedure TfrmCadExcInforme.CmeCadastroFind(Sender: TObject);
begin
   if MontaSelect.RetornouValor then begin
      qry.Close;
      qry.ParamByName('IDRUBRICAPRIN').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
      qry.ParamByName('IDRUBRICA').AsInteger     := StrToInt(MontaSelect.ValoresChave[1]);
      qry.Open;
   end;
end;

procedure TfrmCadExcInforme.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblcRubPrinc.Enabled :=False;
  dblcRubrica.Enabled  :=False;
  dblcLinhaInforme.SetFocus;
end;

procedure TfrmCadExcInforme.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dblcRubPrinc.Enabled :=True;
  dblcRubrica.Enabled  :=True;
  dblcRubPrinc.SetFocus;
end;

end.
