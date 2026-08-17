{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadPortFormaxEmptmo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, wwdblook, Db, Wwdatsrc, DBTables, Wwquery, StdCtrls, Mask,
  wwdbedit, DBCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, UMensErro, UAutorizacao,
  USistema, FTelaAut, ComCtrls, Menus, CMTree, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, uIntegraBack, FSairAjuda, fcButton, fcImgBtn, fcShapeBtn;

type
  TfrmCadPortFormaxEmptmo = class(TfrmSairAjuda)
    dsPortFormaxModulo: TwwDataSource;
    qryPortForma: TwwQuery;
    qryAux: TwwQuery;
    qryPortFormaxModulo: TwwQuery;
    Panel3: TPanel;
    Panel1: TPanel;
    ToolbarSep971: TToolbarSep97;
    dsPortForma: TwwDataSource;
    btnIncluir: TfcShapeBtn;
    btnExcluir: TfcShapeBtn;
    LstItensNAOAss: TDBLookupListBox;
    LstItensAss: TDBLookupListBox;
    rdgFiltro: TRadioGroup;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgFiltroClick(Sender: TObject);

   private  // Private declarations

    Item : String;

    procedure AbreItens;

   public   // Public declarations

  end;


var
  frmCadPortFormaxEmptmo: TfrmCadPortFormaxEmptmo;


implementation
{$R *.DFM}


uses
   UFuncoesEmptmo,
   UModulo,
   uDataBase,
   DBaseDados;


procedure TfrmCadPortFormaxEmptmo.btnIncluirClick(Sender: TObject);
var
   sSQL  : String;
   sItem : Double;
   nItem : Integer;
begin

   if not qryPortForma.eof then begin

      sSQL :=
      'INSERT INTO PORTFORMAXMODULO (' + #13 +
      'IDEMPRESAPROP, '                + #13 +
      'CODPORTFORMA, '                 + #13 +
      'IDMODULO) '                     + #13 +
      'VALUES ('                       + #13 +
      IntToStr( Sistema.IdEmpresa )                     + ', ' + #13 +
      qryPortForma.FieldByName('CODPORTFORMA').AsString + ', ' + #13 +
      IntToStr( Sistema.IdModulo )                             + ') ';

      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;

      try
         qryAux.ExecSQL;

      except
         MsgDlg('Não foi possível completar a inclusão!', 'Empréstimo', mtError, [mbOK], 0);
         Repaint;

         Raise;
         Repaint;
      end;

      with qryPortForma do begin

         Next;
         if Eof then Prior;
         nItem := FieldByName('CODPORTFORMA').AsInteger;
         AbreItens;
         LstItensNAOAss.KeyValue := nItem;

      end;

   end;

end;


procedure TfrmCadPortFormaxEmptmo.btnExcluirClick(Sender: TObject);
var
   sSQL  : String;
   nItem : Double;
begin

   if not qryPortFormaxModulo.eof then begin

      sSQL :=
      'DELETE FROM PORTFORMAXMODULO '                                                     + #13 +
      'WHERE IDEMPRESAPROP = ' + IntToStr( Sistema.IdEmpresa )                            + #13 +
      'AND   CODPORTFORMA  = ' + qryPortFormaxModulo.FieldByName('CODPORTFORMA').AsString + #13 +
      'AND   IDMODULO      = ' + IntToStr( Sistema.IdModulo );

      qryAux.SQL.Clear;
      qryAux.SQL.Text := sSQL;

      try
         qryAux.ExecSQL;

      except
         MsgDlg('Não foi possível completar a exclusão!', 'Empréstimo', mtError, [mbOK], 0);
         Repaint;

         Raise;
         Repaint;
      end;

      with qryPortFormaxModulo do begin

         Next;
         if Eof then Prior;
         nItem := FieldByName('CODPORTFORMA').AsInteger;
         AbreItens;
         LstItensAss.KeyValue := nItem;

      end;

   end;

end;


procedure TfrmCadPortFormaxEmptmo.AbreItens;
begin

   with qryPortForma do begin

      LimpaParametros(qryPortForma);
      ParamByName('PIDEMPRESAPROP').asInteger := Sistema.IdEmpresa;
      ParamByName('PIDMODULO').asInteger      := Sistema.IdModulo;
      Open;

      if rdgFiltro.ItemIndex = 0 then
         Filter   := 'RECPAG = ''P'' ';

      if rdgFiltro.ItemIndex = 1 then
         Filter   := 'RECPAG = ''R'' ';

      Filtered := (rdgFiltro.ItemIndex < 2);

   end;

   with qryPortFormaxModulo do begin

      LimpaParametros(qryPortFormaxModulo);
      ParamByName('PIDEMPRESAPROP').asInteger := Sistema.IdEmpresa;
      ParamByName('PIDMODULO').asInteger      := Sistema.IdModulo;
      Open;

      Filter   := qryPortForma.Filter;
      Filtered := qryPortForma.Filtered;

   end;

end;


procedure TfrmCadPortFormaxEmptmo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreItens;
end;


procedure TfrmCadPortFormaxEmptmo.rdgFiltroClick(Sender: TObject);
begin
  inherited;
  AbreItens;
end;


end.
