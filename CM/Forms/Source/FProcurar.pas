unit FProcurar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DB,
  DBCtrls, FOkCancelar, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  cmseldlg;

type
  TCMProcurar = class(TfrmOkCancelar)
    seldlg: TcmSelectDlg;
  private
    { Private declarations }
    FirstActiveControl: TWinControl;
  protected
      procedure DoShow; override;

  public
    { Public declarations }
    Filter: string;
    function Procurar(dset: TDataSet) : Boolean; virtual;
    constructor Create(AOwner: TComponent); override;
  end;

var
  CMProcurar: TCMProcurar;

implementation

{$R *.DFM}

uses FSelecionar, UMensErro;

constructor TCMProcurar.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   FirstActiveControl := ActiveControl;
end;

procedure TCMProcurar.DoShow;
var
   i: Integer;

begin
   inherited DoShow;
   if Assigned(FirstActiveControl) then FirstActiveControl.SetFocus;
   for i := 0 to ComponentCount - 1 do begin
      if Components[i].Tag = 0 then begin
         if Components[i] is TCustomEdit then
            TCustomEdit(Components[i]).Text := '';
      end;
   end;
end;

function TCMProcurar.Procurar(dset: TDataSet): Boolean;
var
   bmrk, bmrk2: TBookmark;
   FiltroAnt: string;
   Filtrava: Boolean;

begin
   Result := False;
   seldlg.DataSet := dset;

   FiltroAnt := dset.Filter;
   Filtrava  := dset.Filtered;
   dset.Filtered := False;

   bmrk := dset.GetBookmark;
   bmrk2 := dset.GetBookmark;

   //ShowModal : dá o display no formulário filho do FPrc
   // que é chamado de acordo com o cadastramento que está sendo
   // feito. No formulário chamado é que será feito o filtro.
   if ShowModal = mrOk then begin
      dset.Filtered := False;
      if Trim(dset.Filter) = '' then begin
         if Trim(Filter) <> '' then dset.Filter   := Filter;
      end
      else
         if Trim(Filter) <> '' then
            dset.Filter   := '(' + dset.Filter + ') AND (' + Filter + ')';

      if Trim(dset.Filter) <> '' then dset.Filtered := True;

      if (dset.IsEmpty) then begin
         MsgDlg('Tabela está vazia', 'Aviso', mtError, [mbOk,mbHelp], 0);
      end
      else
         if not (dset.IsEmpty) then begin
            Result := seldlg.Execute;
            if Result then bmrk2 := dset.GetBookmark;
         end;
   end;

   with dset do begin
      Filtered := False;
      Filter   := FiltroAnt;
      Filtered := Filtrava;
   end;

   if Not Result then
      dset.GotoBookMark(bmrk)
   else begin
      dset.GotoBookMark(bmrk2);
      dset.FreeBookmark(bmrk2);
   end;

   dset.FreeBookmark(bmrk);
end;

end.
