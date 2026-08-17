unit fAtuObjRAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, wwQuery, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, menus;

type
  TfrmAtuObjRAD = class(TfrmOkCancelar)
    Label1: TLabel;
    qryObjRAD: TwwQuery;
    dsObjRAD: TwwDataSource;
    updObjRad: TUpdateSQL;
    qryObjRADIDOBJETO: TFloatField;
    qryObjRADIDMODULO: TFloatField;
    qryObjRADDESCOBJETO: TStringField;
    qryObjRADNOMEOBJETO: TStringField;
    qry: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure InsereItem( ItemMenu : TMenuItem);
    function ItemLimpo( s : String) : string;
  public
    { Public declarations }
  end;

var
  frmAtuObjRAD: TfrmAtuObjRAD;

implementation
uses uSistema, uDataBase;

{$R *.DFM}

procedure TfrmAtuObjRAD.bbtnConfirmarClick(Sender: TObject);
var i : integer;
begin
     inherited;
     Label1.Caption := 'Atualizando objetos';
     with qryObjRAD do
     begin
          close;
          open;
          for i := 0 to Application.MainForm.Menu.Items.Count-1 do
              InsereItem(Application.MainForm.Menu.Items[i]);
     end;
     AplicaAlteracoes([qryObjRAD]);
     Label1.Caption := 'Atualizando concluida';
end;

procedure TfrmAtuObjRAD.InsereItem( ItemMenu : TMenuItem);
var i, nId : integer;
begin
     if ItemMenu.Count > 0 then
        for i := 0 to ItemMenu.Count-1 do
            InsereItem(ItemMenu.Items[i]);

     with qryObjRAD do
     begin
          close;
          open;
          if ItemMenu.Caption <> '-' then
          begin
               Insert;
               nId := LeUltRegistro(nil, 'RADOBJETO');
               FieldByName('IDOBJETO').AsInteger := nId;
               FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
               FieldByName('DESCOBJETO').AsString := ItemLimpo(ItemMenu.Caption);
               FieldByName('NOMEOBJETO').AsString := ItemMenu.Name;
               if not FazQuery( qry, 'SELECT IDOBJETO FROM RADOBJETO WHERE (IDMODULO = '+ IntToStr(Sistema.IdModulo)+') AND ( NOMEOBJETO = '''+ItemMenu.Name+''')') then
               begin
                    ExecutarQuery(qry, 'insert into RADOBJETO (IDOBJETO, IDMODULO, DESCOBJETO, NOMEOBJETO) '+
                                       'values ( '+IntToStr(nId)+', '+ IntToStr(Sistema.IdModulo)+', '''+ItemLimpo(ItemMenu.Caption)+''', '''+ItemMenu.Name+''')');
               end
               else
               begin
                    ExecutarQuery(qry, 'update RADOBJETO set '+
                                       'NOMEOBJETO =  '''+ItemMenu.Name+''''+
                                       'where IDMODULO = ('+IntToStr(nId)+') and (DESCOBJETO = '''+ItemLimpo(ItemMenu.Caption)+''')');
               end;
          end;
     end;
     Application.ProcessMessages;
end;

function TfrmAtuObjRAD.ItemLimpo( s : String) : string;
var p : integer;
begin
     p := Pos('&', s);
     if p > 0 then
        Result := Copy(s,1,p-1)+Copy(s,p+1,100)
     else
         Result := s;
end;

end.
