unit cmFluxOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, uAutorizacao, wwQuery, TB97, extctrls, db, Wwdatsrc,
  TB97Tlwn, TB97Ctls, DAutorizacao, FCmPrincipalForms;

type
  TcmFluxOper = class
  private
         { Private declarations }
         _MainForm: TfrmCMPrincipalForms;
         _tb97: TToolWindow97;
         _tb97btnCancelar: TToolbarButton97;
         _tb97btnAnterior: TToolbarButton97;
         _tb97btnSeguinte: TToolbarButton97;
         _pnlTexto: TPanel;
         _TempFluxOper: TBookMark;
         _TempPasso: TBookMark;
         _TempCapAnterior: string;
         _TempCapSeguinte: string;
         _TempEnbAnterior: Boolean;
         _TempEnbSeguinte: Boolean;
         FAtivo : boolean;
         _Primeiro : boolean;
         _Ultimo : boolean;
         FProximo : boolean;
  protected
    { Protected declarations }

  public
    { Public declarations }
    procedure MudaVisivel;
    procedure Setup;
    procedure Cancelar;
    procedure MudouDock;
    procedure Anterior;
    procedure Seguinte;
    procedure Salva;

    property Ativo : boolean read FAtivo write FAtivo;
    property Proximo : boolean read FProximo write FProximo;
  published

  end;

var
   FluxOper : TCMFluxOper;

implementation

uses uSistema;

procedure TcmFluxOper.Setup;
begin
     if (Application.MainForm <> nil) and
        ((AnsiUpperCase(Application.MainForm.name) = 'FRMPRINCIPAL') or
        (AnsiUpperCase(Application.MainForm.name) = 'FRMPRINCIP')) then
     begin
          _MainForm := TfrmCMPrincipalForms(Application.MainForm);

          DtmAutorizacao.SqlFluxOper.Prepare;
          DtmAutorizacao.SqlFluxOper.ParamByName('IDMODULO').AsInteger  := Sistema.IdModulo;
          DtmAutorizacao.SqlFluxOper.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
          DtmAutorizacao.SqlFluxOper.Open;
          
          _tb97 := _MainForm.tb97FluxOper ;
          _tb97btnAnterior := _MainForm.tb97btnAnterior ;
          _tb97btnSeguinte := _MainForm.tb97btnSeguinte;
          _tb97btnCancelar := _MainForm.tb97btnCancelar;
          _pnlTexto := _MainForm.pnlTextoFluxOper;
          FProximo := true;
          _tb97.Left := 80;
          _tb97.Top := 100;
     end;
end;

procedure TcmFluxOper.MudaVisivel;
begin
     Autorizacao.FecharForms;
     if _tb97.Visible then
     begin
          Salva;
          Autorizacao.HabilitarComponente(_MainForm.Menu, false);

          If DtmAutorizaCao.CdsFluxOper.Active Then DtmAutorizaCao.CdsFluxOper.Close;
          DtmAutorizaCao.SqlFluxOper.Open;

          if (DtmAutorizaCao.CdsFluxOper.IsEmpty) then
             _tb97.Visible := false
          else
          begin
               _tb97btnAnterior.Enabled := false;                                         
               _tb97btnSeguinte.Enabled := true;
               _tb97btnSeguinte.Caption := 'Iniciar >>';
               _Primeiro := true;
          end;

          DtmAutorizaCao.CdPasso.FreeBookmark(_TempPasso);
          DtmAutorizaCao.CdsFluxOper.FreeBookMark(_TempFluxOper);
     end
     else
     begin
          Autorizacao.HabilitarComponente(_MainForm.Menu, true);
          Autorizacao.AutorizarForm(_MainForm, afNormal);
     end;
     FAtivo := _tb97.Visible;
end;

procedure TcmFluxOper.MudouDock;
begin
     _pnlTexto.Visible := (_tb97.DockedTo = nil);
     if _pnlTexto.Visible then
        _tb97.Height := 150
     else
     begin
         _tb97.Height := 22;
         _tb97.DockedTo.Height := 22;
     end;

     DtmAutorizacao.CdPasso.GotoBookmark(_TempPasso);
     DtmAutorizacao.CdsFluxOper.GotoBookmark(_TempFluxOper);
     
     _tb97btnAnterior.Caption := _TempCapAnterior;
     _tb97btnSeguinte.Caption := _TempCapSeguinte;
     _tb97btnAnterior.Enabled := _TempEnbAnterior;
     _tb97btnSeguinte.Enabled := _TempEnbSeguinte;
end;

procedure TcmFluxOper.Cancelar;
begin
  _tb97.Visible := false;
end;

procedure TcmFluxOper.Seguinte;
begin
     if (DtmAutorizacao.CdPasso.Active) and
        (FProximo) then
     begin
          if _Primeiro then
          begin
               _tb97btnSeguinte.Caption := 'Seguinte >>';
               DtmAutorizacao.CdPasso.First;
               _Primeiro := false;
          end
          else
               DtmAutorizacao.CdPasso.Next;
          if DtmAutorizacao.CdPasso.eof then
          begin
               _Ultimo := true;
          end
          else
          begin
               _tb97btnAnterior.Enabled := true;
               _Ultimo := false;

               DtmAutorizacao.CdPasso.next;
               if DtmAutorizacao.CdPasso.eof then
                  _tb97btnSeguinte.Enabled := false
               else
                   DtmAutorizacao.CdPasso.Prior;

               AbreItemMenu(DtmAutorizacao.CdPasso.FieldByName('ITEMMENU').AsString);
          end;
     end;
end;

procedure TcmFluxOper.Anterior;
begin
     if (DtmAutorizacao.CdPasso.Active) then
     begin
          if not _Ultimo then
          begin
               _tb97btnSeguinte.Enabled := true;
               DtmAutorizacao.CdPasso.Prior;
          end;
          FProximo := false;
          Autorizacao.FecharForms;
          FProximo := true;
          _Ultimo := false;
          TMenuItem(_MainForm.FindComponent(DtmAutorizacao.CdPasso.FieldByName('ITEMMENU').AsString)).Click;
          // Verifica se e o ultimo registro
          DtmAutorizacao.CdPasso.Prior;
          if DtmAutorizacao.CdPasso.bof then
             _tb97btnAnterior.Enabled := false
          else
              DtmAutorizacao.CdPasso.Next;
     end;
end;

procedure TcmFluxOper.Salva;
begin
     _TempPasso       := DtmAutorizacao.CdPasso.GetBookmark;
     _TempFluxOper    := DtmAutorizacao.CdsFluxOper.GetBookmark;
     _TempCapAnterior := _tb97btnAnterior.Caption;
     _TempCapSeguinte := _tb97btnSeguinte.Caption;
     _TempEnbAnterior := _tb97btnAnterior.Enabled;
     _TempEnbSeguinte := _tb97btnSeguinte.Enabled;
end;

initialization
   FluxOper := TcmFluxOper.Create;  
finalization
   FluxOper.Free;
end.
