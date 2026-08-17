unit FAssocProvPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Wwdbigrd, Wwdbgrid,
  DBCtrls, Grids, DBGrids, Db, DBTables, Wwquery, Wwdatsrc, Menus, FTelaAut,
  TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti, Wwdbgrd2;

type
  TfrmAssocProvPatro = class(TfrmSairAjuda)
    dsPatro: TwwDataSource;
    qryPatro: TwwQuery;
    Panel4: TPanel;
    dsProvPatro: TwwDataSource;
    pmenu: TPopupMenu;
    AlterarCodigo: TMenuItem;
    qryProvPatro: TwwQuery;
    qryAux: TwwQuery;
    dsProv: TwwDataSource;
    qryProv: TwwQuery;
    MontaSqlProv: TMontaSelect;
    MontaSqlRXP: TMontaSelect;
    qryPatroIDPESSOA: TFloatField;
    qryPatroNOME: TStringField;
    qryPatroRAZAOSOCIAL: TStringField;
    qryPatroFLGPATROCINADORA: TFloatField;
    qryPatroFLGFUNDACAO: TFloatField;
    GroupBox1: TGroupBox;
    dbgrdPatro: TwwDBGrid2;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    GroupBox4: TGroupBox;
    wwDBGrid2: TwwDBGrid;
    btnProcRXP: TBitBtn;
    btnProcProv: TBitBtn;
    sbtnAssocia: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure dblkplistPlanoDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dblkplistPlanoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dblkplistPlanoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnProcProvClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProcRXPClick(Sender: TObject);
    procedure wwDBGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure wwDBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure wwDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wwDBGrid2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure wwDBGrid2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure wwDBGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    IdProvento: string;

    procedure MontaTelaLerCodProvento;
    procedure AssociaProvento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssocProvPatro: TfrmAssocProvPatro;
 
implementation

uses FLerCodProvento, UMensErro, UAdmAss, USistema, FPlanAss, DBaseDados;

{$R *.DFM}

procedure TfrmAssocProvPatro.AssociaProvento;
begin
  inherited;
  AbrirForm(frmLerCodProvento, TfrmLerCodProvento, false);
  With frmLerCodProvento do
  begin
    MontaTelaLerCodProvento;
    LabelCodRub.Caption:= qryProv.FieldByName('IdProvento').AsString;
    edCodProvento.Text:= qryProv.FieldByName('IdProvento').AsString;
    edDescProvento.Text:= qryProv.FieldByName('Descricao').AsString;
    sCodProvento:=qryProv.FieldByName('IdProvento').AsString;
    sDescProvento:=EdDescProvento.Text;
    EdCodProvento.SetFocus;
  end;
end; //AssociaProvento

procedure TfrmAssocProvPatro.FormActivate(Sender: TObject);
begin
  inherited;
  qryProv.Close;
  qryProv.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryProv.Open;

  qryProvPatro.Close;
  qryProvPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryProvPatro.Open;
end;

procedure TfrmAssocProvPatro.sbtnAssociaClick(Sender: TObject);
begin
  inherited;
  If Not QryProv.IsEmpty then
  begin
    AssociaProvento;
    IdProvento := qryProv.FieldByName('IDPROVENTO').AsString;
    If IdProvento <> '' then
    begin
      qryProv.Close;
      qryProv.ParamByName('IdPessoa').AsInteger:= qryPatro.FieldbyName('IdPessoa').AsInteger;
      qryProv.Open;
      qryProv.Locate('IDPROVENTO',IdProvento,[loPartialKey]);

      qryProvPatro.Close;
      qryProvPatro.ParamByName('IdPessoa').AsInteger:= qryPatro.FieldbyName('IdPessoa').AsInteger;
      qryProvPatro.Open;
    end;
  end;
end;

procedure TfrmAssocProvPatro.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;
  If Not QryProvPatro.IsEmpty then
  begin
     If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' DELETE RUBRICAXPESS '+
                   ' WHERE (IDRUBRICA = '+qryProvPatro.FieldByName('IdRubrica').AsString+') AND '+
                   '       (IDPESSOA  = '+qryPatro.FieldByName('IdPESSOA').AsString+')');
    try
       qryAux.ExecSQL;
       dtmBaseDados.dbBaseDados.Commit;
    except
       on E: EDBEngineError do begin
          MostrarErro(E);
          dtmBaseDados.dbBaseDados.Rollback;
          Exit;
       end;
    end;
    qryProv.Close;
    qryProv.ParamByName('IdPessoa').AsInteger:= qryPatro.FieldbyName('IdPessoa').AsInteger;
    qryProv.Open;

    qryProvPatro.Close;
    qryProvPatro.ParamByName('IdPessoa').AsInteger:= qryPatro.FieldbyName('IdPessoa').AsInteger;
    qryProvPatro.Open;
  end;
end;

procedure TfrmAssocProvPatro.dblkplistPlanoDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  { Este método é executado quando o usuario clica na lista de
    Planos JA associados (dblkplistPlano), arrasta um plano e
    solta o mouse. Ao soltar o mouse, se o método DragOver deste
   objeto retornar o Accept = True, este método é executado. }
  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(Sender);
end;

procedure TfrmAssocProvPatro.dblkplistPlanoDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  { Sender = list
    Source = grid ou de onde veio o drag }
  Accept := False;

  if (not qryProv.Active) or (not qryProvPatro.Active) then
    Exit;

  if (Source is TwwDBGrid) then
     { Se o drag não vier do grid, cancelar }
     Accept := True;
end;

procedure TfrmAssocProvPatro.dblkplistPlanoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TDBLookUpListBox then
    TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmAssocProvPatro.qryPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryProv.Close;
  qryProv.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryProv.Open;

  qryProvPatro.Close;
  qryProvPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryProvPatro.Open;
end;

procedure TfrmAssocProvPatro.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryProv.Close;
  qryProvPatro.Close;

  WindowState := wsMaximized;

  if bRubricaPatrocinadora = True then
   Caption := 'Associação de Rubricas por Patrocinadora'
  else Caption := 'Associação de Rubricas por Fundação';

  qryPatro.SQL.Clear;

//  tavares 13/03/2003
  { qryPatro.SQL.Add('SELECT IDPESSOA,NOME,RAZAOSOCIAL, FLGPATROCINADORA, FLGFUNDACAO ' +
                     'FROM PESSOA ' +
                    'WHERE (FLGPATROCINADORA = 1) ' +
                       'or (FLGFUNDACAO = 1)'); }

  qryPatro.SQL.Add(' SELECT '+
  '  DISTINCT  P.IDPESSOA , P.NOME, RAZAOSOCIAL, FLGPATROCINADORA, FLGFUNDACAO '+
  ' FROM PESSOA P, PATRO PT '+
  ' WHERE P.IDPESSOA = PT.IDPESSOA '+
  ' ORDER BY NOME ');

  qryPatro.Close;
  qryPatro.Open;
end;

procedure TfrmAssocProvPatro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryProv.Close;
  qryProvPatro.Close;

  qryProv.UnPrepare;
  qryProvPatro.UnPrepare;
end;

procedure TfrmAssocProvPatro.MontaTelaLerCodProvento;
begin
  with frmLerCodProvento do begin
     if bRubricaPatrocinadora = True then
     begin
       Caption:= 'Associar Rubrica à Patrocinadora';
       gbPatrocinadora.Caption:= 'Patrocinadora';
       lbPatrocinadora.Caption:= qryPatro.FieldByName('Nome').AsString;
     end
     else
     begin
       Caption := 'Associar Rubrica à Fundação';
       gbPatrocinadora.Caption:= 'Fundação';
       lbPatrocinadora.Caption := qryPatro.FieldByName('Nome').AsString;
     end;
  end;
end;

procedure TfrmAssocProvPatro.btnProcProvClick(Sender: TObject);
begin
  MontaSqlProv.Executar;
  if (MontaSqlProv.RetornouValor) then
  begin
    qryProv.Close;
    qryProv.Open;
    qryProv.Locate('DESCRICAO',MontaSqlProv.ValoresChave[0],
                    [loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TfrmAssocProvPatro.btnProcRXPClick(Sender: TObject);
begin
  inherited;
  MontaSqlRXP.Filtro[0] := 'PP.IDPESSOA = '+qryPatro.FieldbyName('IdPessoa').AsString;
  MontaSqlRXP.Executar;
  if (MontaSqlRXP.RetornouValor) then
  begin
     qryProvPatro.Close;
     qryProvPatro.Open;
     qryProvPatro.Locate('DESCRPROVDESC',MontaSqlRXP.ValoresChave[0],[loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TfrmAssocProvPatro.wwDBGrid1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  { = Associa Click }
  { Este método é executado quando o usuario clica na lista de
    Planos nao associados (dblkplistPlano), arrasta um plano e
    solta o mouse. Ao soltar o mouse, se o método DragOver deste
    objeto(dblkplistPlanPatro) retornar o Accept = True, este método
    é executado.}
  TdbLookUpListBox(Sender).EndDrag(True);
  sbtnAssociaClick(Sender);
end;

procedure TfrmAssocProvPatro.wwDBGrid1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
 { Sender = grid
    Source = list ou de onde veio o drag }
  Accept := False;

  if (not qryProv.Active) or (not qryProvPatro.Active) then
    Exit;

  if (Source is TDBLookUpListBox) then
     { Se o drag não vier da lista de plano, cancelar }
     Accept := True;
end;

procedure TfrmAssocProvPatro.wwDBGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
 if Button = mbLeft then
    if Sender is TwwDBGrid then TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TfrmAssocProvPatro.wwDBGrid2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(Sender);
end;

procedure TfrmAssocProvPatro.wwDBGrid2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
 { Sender = list
    Source = grid ou de onde veio o drag }
  Accept := False;

  if (not qryProv.Active) or (not qryProvPatro.Active) then
    Exit;

  if (Source is TwwDBGrid) then
     { Se o drag não vier do grid, cancelar }
     Accept := True;
end;

procedure TfrmAssocProvPatro.wwDBGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TDBLookUpListBox then TDBLookUplistBox(Sender).BeginDrag(True);
end;

end.
