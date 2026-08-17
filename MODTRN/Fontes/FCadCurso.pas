unit FCadCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, ComCtrls, ToolWin, ExtCtrls, DBTables, Wwtable,
  wwdblook, Mask, Wwquery, TB97, IvDictio, IvMulti, IvEMulti, TB97Ctls,
  TB97Tlbr, MontaSelect, CmEventosCadastro, wwDialog, ImgList;

type
  TfrmCadCurso = class(TfrmCadastro)
    tblCurso: TwwTable;
    Label1: TLabel;
    dbedCodCurso: TDBEdit;
    Label6: TLabel;
    dbedDescricao: TDBEdit;
    Label7: TLabel;
    dbedAbrev: TDBEdit;
    Label2: TLabel;
    dblcTipCurso: TwwDBLookupCombo;
    Label4: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label5: TLabel;
    dblcPacote: TwwDBLookupCombo;
    Label8: TLabel;
    dblcEntid: TwwDBLookupCombo;
    Label9: TLabel;
    dbedValor: TDBEdit;
    Label10: TLabel;
    dbedDurPrat: TDBEdit;
    Label11: TLabel;
    dbedDurTeor: TDBEdit;
    dbrgAvaTeor: TDBRadioGroup;
    Label25: TLabel;
    dbedAvaliacao: TDBEdit;
    dbrgAvaPrat: TDBRadioGroup;
    Label27: TLabel;
    dbedAvalPrat: TDBEdit;
    dbedObserv: TDBMemo;
    Label3: TLabel;
    qryGrupoTr: TwwQuery;
    qryTipCurso: TwwQuery;
    qryPacote: TwwQuery;
    qryEntid: TwwQuery;
    MontaSelectCurso: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure tblCursoBeforePost(DataSet: TDataSet);
    procedure tblCursoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCurso: TfrmCadCurso;

implementation

uses uDataBase;

{$R *.DFM}

procedure TfrmCadCurso.FormCreate(Sender: TObject);
begin
  inherited;
  tblCurso.Open;
  qryGrupotr.Open;
  qryPacote.Open;
  qryTipCurso.Open;
  qryEntid.Open;
end;

procedure TfrmCadCurso.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  sbtnProcurar.down := false;
  MontaSelectCurso.Executar;
  if (MontaSelectCurso.ValoresChave.Count > 0) and
     (MontaSelectCurso.ValoresChave[0] <> '')  then
     tblCurso.FindKey([StrToInt(MontaSelectCurso.ValoresChave[0])]);
end;





procedure TfrmCadCurso.tblCursoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if  tblCurso.FieldByName('DUR_TEOR').Value = Null  then
      tblCurso.FieldByName('DUR_TEOR').Value := 0;
  if  tblCurso.FieldByName('DUR_PRAT').Value = Null  then
      tblCurso.FieldByName('DUR_PRAT').Value := 0;
end;

procedure TfrmCadCurso.tblCursoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tblCurso.FieldByName('IDCURSO').AsInteger := LeUltRegistro(nil,'CURSO');
  tblCurso.FieldByName('TEMAVAL').AsInteger := 0;
  tblCurso.FieldByName('TEMAVPR').AsInteger := 0;
end;

end.
