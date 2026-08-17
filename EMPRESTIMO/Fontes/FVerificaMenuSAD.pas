unit FVerificaMenuSAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Menus, FOkCancelarImob, Printers;

type
  TfrmVerificaMenuSAD = class(TfrmOkCancelarImob)
    Label1: TLabel;
    qryModulo: TwwQuery;
    dsFuncoes: TwwDataSource;
    qryMenu: TwwQuery;
    pgCtrlVerificaMenu: TPageControl;
    tbsResultado: TTabSheet;
    qryBanco: TwwQuery;
    lblNomeModulo: TLabel;
    bbtnSalvar: TBitBtn;
    ToolbarSep975: TToolbarSep97;
    dlgSalvar: TSaveDialog;
    ToolbarSep976: TToolbarSep97;
    bbtnImprimir: TBitBtn;
    memResult: TRichEdit;

    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  end;



var
  frmVerificaMenuSAD: TfrmVerificaMenuSAD;



implementation
{$R *.DFM}
uses
   FPrincipal, USistema, UMensErro;



procedure TfrmVerificaMenuSAD.FormShow(Sender: TObject);
begin
   inherited;
   memResult.Lines.Clear;
end;


procedure TfrmVerificaMenuSAD.bbtnConfirmarClick(Sender: TObject);
var
   i, j, k, l  : word;
   bAlgumaInconsist,
   bEncontrou : boolean;
   sNomeBanco, sNomeMenu : string;
   SubMenu, SubMenu2, SubMenu3   : TMenuItem;
begin
   inherited;

   memResult.Lines.Clear;
   memResult.Lines.Add('Inconsistências Encontradas : ');
   memResult.Lines.Add(' ');
   memResult.Lines.Add('1. Existe no Sistema e NÃO existe no Banco de Dados ');
   memResult.Lines.Add(' ');

   bAlgumaInconsist := False;

   with frmPrincipal do begin

      for i := 0 to mnu.Items.Count - 1 do begin

         SubMenu := mnu.Items[i];
         for j := 0 to SubMenu.Count - 1 do begin

            if not SubMenu.Items[j].Visible then Continue;

            if Pos('&',SubMenu.Items[j].Caption) > 0 then begin
               if Pos('&',SubMenu.Items[j].Caption) = 1 then begin
                  sNomeMenu   := copy(SubMenu.Items[j].Caption,2, Length(SubMenu.Items[j].Caption) - 1);
               end else begin
                  sNomeMenu   := copy(SubMenu.Items[j].Caption, 1, Pos('&', SubMenu.Items[j].Caption) - 1) +
                                 copy(SubMenu.Items[j].Caption, Pos('&', SubMenu.Items[j].Caption) + 1,
                                 Length(SubMenu.Items[j].Caption) - Pos('&', SubMenu.Items[j].Caption))
               end;

            end else begin
               sNomeMenu := SubMenu.Items[j].Caption;
            end;

            if (sNomeMenu = '') or (sNomeMenu = '-') then continue;

            qryMenu.Close;
            qryMenu.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
            qryMenu.ParamByName('NOMEFUNCAO').AsString := sNomeMenu;
            qryMenu.Open;

            if qryMenu.IsEmpty then begin
               bAlgumaInconsist := True;
               memResult.Lines.Add(sNomeMenu);
            end;

              // Verificar se SubMenu possui "filho", ou seja, outro submenu
            if SubMenu.Items[j].Count > 0 then begin
               SubMenu2 := SubMenu.Items[j];

                 for k := 0 to SubMenu2.Count - 1 do begin
                    if Pos('&',SubMenu2.Items[k].Caption) > 0
                    then if Pos('&',SubMenu2.Items[k].Caption) = 1
                         then sNomeMenu := Copy(SubMenu2.Items[k].Caption,2, Length(SubMenu2.Items[k].Caption) - 1)
                         else sNomeMenu := Copy(SubMenu2.Items[k].Caption, 1, Pos('&',SubMenu2.Items[k].Caption)-1)+
                                           Copy(SubMenu2.Items[k].Caption, Pos('&',SubMenu2.Items[k].Caption) + 1, Length(SubMenu2.Items[k].Caption) - Pos('&',SubMenu2.Items[k].Caption))
                    else sNomeMenu := SubMenu2.Items[k].Caption;

                    if (sNomeMenu = '') or (sNomeMenu = '-') then continue;

                    qryMenu.Close;
                    qryMenu.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
                    qryMenu.ParamByName('NOMEFUNCAO').AsString := sNomeMenu;
                    qryMenu.Open;

                    if qryMenu.IsEmpty
                    then begin
                       bAlgumaInconsist := True;
                       memResult.Lines.Add(sNomeMenu);
                    end;
                 end; // for k
              end; // if SubMenu[j]
           end;

      end; // for 1
   end; // with

   memResult.Lines.Add(' ');
   memResult.Lines.Add('2. Existe no Banco de Dados e NÃO existe no Sistema ');
   memResult.Lines.Add(' ');

   qryBanco.Close;
   qryBanco.ParamByName('IDMODULO').AsInteger := Sistema.IdModulo;
   qryBanco.Open;

   qryBanco.First;
   while not qryBanco.Eof do
   begin
      sNomeBanco := qryBanco.FieldByName('NOMEFUNCAO').AsString;

      bEncontrou := False;
      with frmPrincipal do
      begin
         for i := 0 to mnu.Items.Count - 1 do
         begin
            if Pos('&',mnu.Items[i].Caption) > 0
            then if Pos('&',mnu.Items[i].Caption) = 1
                 then sNomeMenu := Copy(mnu.Items[i].Caption,2, Length(mnu.Items[i].Caption) - 1)
                 else sNomeMenu := Copy(mnu.Items[i].Caption, 1, Pos('&',mnu.Items[i].Caption)-1)+
                                   Copy(mnu.Items[i].Caption, Pos('&',mnu.Items[i].Caption) + 1, Length(mnu.Items[i].Caption) - Pos('&',mnu.Items[i].Caption))
            else sNomeMenu := mnu.Items[i].Caption;

            if UpperCase(Trim(sNomeBanco)) = UpperCase(Trim(sNomeMenu))
            then begin
               bEncontrou := True;
               break;
            end;

            SubMenu   := mnu.Items[i];
            for j := 0 to SubMenu.Count - 1 do
            begin
               if Pos('&',SubMenu.Items[j].Caption) > 0
               then if Pos('&',SubMenu.Items[j].Caption) = 1
                    then sNomeMenu := Copy(SubMenu.Items[j].Caption,2, Length(SubMenu.Items[j].Caption) - 1)
                    else sNomeMenu := Copy(SubMenu.Items[j].Caption, 1, Pos('&',SubMenu.Items[j].Caption)-1)+
                                      Copy(SubMenu.Items[j].Caption, Pos('&',SubMenu.Items[j].Caption) + 1, Length(SubMenu.Items[j].Caption) - Pos('&',SubMenu.Items[j].Caption))
               else sNomeMenu := SubMenu.Items[j].Caption;

               if (sNomeMenu = '') or (sNomeMenu = '-') then continue;

               if UpperCase(Trim(sNomeBanco)) = UpperCase(Trim(sNomeMenu))
               then begin
                  bEncontrou := True;
                  break;
               end;

               // Verificar se SubMenu possui "filho", ou seja, outro submenu
               if SubMenu.Items[j].Count > 0
               then begin
                  SubMenu2 := SubMenu.Items[j];

                  for k := 0 to SubMenu2.Count - 1 do
                  begin
                     if Pos('&',SubMenu2.Items[k].Caption) > 0
                     then if Pos('&',SubMenu2.Items[k].Caption) = 1
                          then sNomeMenu := Copy(SubMenu2.Items[k].Caption,2, Length(SubMenu2.Items[k].Caption) - 1)
                          else sNomeMenu := Copy(SubMenu2.Items[k].Caption, 1, Pos('&',SubMenu2.Items[k].Caption)-1)+
                                            Copy(SubMenu2.Items[k].Caption, Pos('&',SubMenu2.Items[k].Caption) + 1, Length(SubMenu2.Items[k].Caption) - Pos('&',SubMenu2.Items[k].Caption))
                     else sNomeMenu := SubMenu2.Items[k].Caption;

                     if (sNomeMenu = '') or (sNomeMenu = '-') then continue;

                     if UpperCase(Trim(sNomeBanco)) = UpperCase(Trim(sNomeMenu))
                     then begin
                        bEncontrou := True;
                        break;
                     end;

                     // Verificar se SubMenu possui "filho", ou seja, outro submenu
                     if SubMenu2.Items[k].Count > 0
                     then begin
                        SubMenu3 := SubMenu2.Items[k];

                        for l := 0 to SubMenu3.Count - 1 do
                        begin
                           if Pos('&',SubMenu3.Items[l].Caption) > 0
                           then if Pos('&',SubMenu3.Items[l].Caption) = 1
                                then sNomeMenu := Copy(SubMenu3.Items[l].Caption,2, Length(SubMenu3.Items[l].Caption) - 1)
                                else sNomeMenu := Copy(SubMenu3.Items[l].Caption, 1, Pos('&',SubMenu3.Items[l].Caption)-1)+
                                                  Copy(SubMenu3.Items[l].Caption, Pos('&',SubMenu3.Items[l].Caption) + 1, Length(SubMenu3.Items[l].Caption) - Pos('&',SubMenu3.Items[l].Caption))
                           else sNomeMenu := SubMenu3.Items[l].Caption;

                           if (sNomeMenu = '') or (sNomeMenu = '-') then continue;

                           if UpperCase(Trim(sNomeBanco)) = UpperCase(Trim(sNomeMenu))
                           then begin
                              bEncontrou := True;
                              break;
                           end;
                        end; // for l
                        if bEncontrou then break;
                     end;
                  end; // for k
                  if bEncontrou then break;
               end; // if SubMenu[j]
            end;
         end; // for 1
      end; // with

      if not bEncontrou
      then begin
         bAlgumaInconsist := True;
         memResult.Lines.Add(sNomeBanco);
      end;
      qryBanco.Next;
   end;

   if not bAlgumaInconsist
   then memResult.Lines.Add('Nenhuma inconsistência encontrada.');

   MsgDlg('Processo Terminado.','Empréstimo',mtInformation,[mbOk],0);
end;



procedure TfrmVerificaMenuSAD.FormCreate(Sender: TObject);
begin
   inherited;
   lblNomeModulo.Caption := Sistema.NomeModulo;
end;



procedure TfrmVerificaMenuSAD.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if dlgSalvar.Execute then
     memResult.Lines.SaveToFile(dlgSalvar.FileName);
end;

procedure TfrmVerificaMenuSAD.bbtnImprimirClick(Sender: TObject);
begin
  inherited;
  memResult.Print('Resultado da Comparação com o SAD');
end;

end.
