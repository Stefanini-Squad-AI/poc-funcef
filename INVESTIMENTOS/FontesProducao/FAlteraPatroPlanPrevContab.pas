unit FAlteraPatroPlanPrevContab;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, TB97Tlbr, TB97, Db, DBTables, Wwquery, CheckLst,
  Wwdatsrc, DBCtrls, Grids, DBGrids,Dialogs;

type
  TfrmAlteraPatroPlanPrevContab = class(TForm)
    Panel1: TPanel;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    dsPatroPlanPrevContab: TwwDataSource;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    DBGrid1: TDBGrid;
    Dock971: TDock97;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    qry: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure GeraPlanPrevCtbPatro;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function VerificaVariaveisPlanPatro:boolean;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlteraPatroPlanPrevContab: TfrmAlteraPatroPlanPrevContab;


implementation

uses Fprincipal, UmensErro, USistema,UDataBase,UBibliotecaInvest;

{$R *.DFM}

procedure TfrmAlteraPatroPlanPrevContab.FormShow(Sender: TObject);
var
   sPatroPlanPrevCtb : string;
begin
   QryPatroPlanPrevContab.Close;
   QryPatroPlanPrevContab.Open;

   if iPlanPrevCtbPatro = 0 then
   begin
      QryPatroPlanPrevContab.First;
      iPatrocinadora    := 0;
      iPlanoPrevContab  := 0;
      iPlanPrevCtbPatro := 0;
      sPlanPrevCtbPatro := '';
      // Monta Plano Default
      If pRPI.IDPLANPREVCTBPATR <> 0 then
         QryPatroPlanPrevContab.Locate('IDPLANPREVCTBPATR',pRPI.IDPLANPREVCTBPATR,[]);

   end
   else
      QryPatroPlanPrevContab.Locate('IDPLANPREVCTBPATR',iPlanPrevCtbPatro,[]);

   Qry.Close;
   Qry.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
   Qry.Open;
   If Not Qry.FieldByName('IDPLANPREVCTBPATR').IsNull Then
      QryPatroPlanPrevContab.Locate('IDPLANPREVCTBPATR',
                   Qry.FieldByName('IDPLANPREVCTBPATR').AsInteger,[]);
   Qry.Close;

   if DBGrid1.CanFocus then
      DBGrid1.SetFocus;

end;

procedure TfrmAlteraPatroPlanPrevContab.bbtnConfirmarClick(Sender: TObject);
begin
   GeraPlanPrevCtbPatro;
end;

procedure TfrmAlteraPatroPlanPrevContab.GeraPlanPrevCtbPatro;
begin
   iPatrocinadora    := QryPatroPlanPrevContab.FieldByName('IDPATRO').AsInteger;
   iPlanoPrevContab  := QryPatroPlanPrevContab.FieldByName('IDPLANOPREV').AsInteger;
   iPlanPrevCtbPatro := QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger;
   sPlanPrevCtbPatro := QryPatroPlanPrevContab.FieldByName('PLANPRVCONTABPATRO').AsString;

   case iTipoInvestUsu of
      1: FrmPrincipal.MudaMenu(iTipoInvestUsu,'F');
      2: FrmPrincipal.MudaMenu(iTipoInvestUsu,'V');
      4: FrmPrincipal.MudaMenu(iTipoInvestUsu,'V');
      5: FrmPrincipal.MudaMenu(iTipoInvestUsu,'I');
      6: FrmPrincipal.MudaMenu(iTipoInvestUsu,'I');
      7: FrmPrincipal.MudaMenu(iTipoInvestUsu,'I');
      8: FrmPrincipal.MudaMenu(iTipoInvestUsu,'B');      
   else  FrmPrincipal.MudaMenu(iTipoInvestUsu,'A');
   end;

   Close;
end;

procedure TfrmAlteraPatroPlanPrevContab.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   if not VerificaVariaveisPlanPatro then
      Exit;
end;

function TfrmAlteraPatroPlanPrevContab.VerificaVariaveisPlanPatro:boolean;
begin
    Result := True;
    if (iPatrocinadora = 0) or (iPlanoPrevContab = 0) or
       (iPlanPrevCtbPatro = 0) or (sPlanPrevCtbPatro = '') then
    begin
       MsgDlg('Falta definir o Plano Contábil por Patrocinadora.', 'Atenção', mtWarning, [mbOk], 0);
       Result := False;
    end;
end;

procedure TfrmAlteraPatroPlanPrevContab.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_Return Then     //Enter
     bbtnConfirmarClick(Sender);
end;

procedure TfrmAlteraPatroPlanPrevContab.DBGrid1DblClick(Sender: TObject);
begin
   GeraPlanPrevCtbPatro;
end;

end.

