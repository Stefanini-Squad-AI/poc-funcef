{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit FProcura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Db, DBTables,
  wwQuery, Wwdatsrc, uTeclado;
const DelayBusca = 1;
type
  TfrmProcura = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edValProc: TEdit;
    bbtnTeclado: TSpeedButton;
    cbCampo: TComboBox;
    Grid: TwwDBGrid;
    botaoOk: TBitBtn;
    botaoCanc: TBitBtn;
    qry: TwwQuery;
    ds: TwwDataSource;
    Teclado1: TTeclado;
    Timer1: TTimer;
    function TiraNomeTbl(const s : string) : string;
    procedure edValProcChange(Sender: TObject);
    function Para_Data(dt: TDateTime): String;
    procedure FormShow(Sender: TObject);
    procedure cbCampoChange(Sender: TObject);
    procedure botaoOkClick(Sender: TObject);
    procedure bbtnTecladoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    CamposSel:TStrings;
    CamposBusca: TStrings;
    NomeTabelas: String;
    CondicaoEspecial:String;
    function PontoFlutuante(x: Real): String;
    procedure Busca;
  public
    { Public declarations }
  end;

var
  frmProcura: TfrmProcura;
  Saidas:TStrings;
function Procura(Fonte:TFont;AbreCheio,UsaTeclado:Boolean;AOwner:TComponent;CpBusca,CpSel,NomeBusca,NomeSel,TamSel:TStrings;ADataBasename,Tabelas,
                Condicao:String; var ValSaida:TStrings):Boolean;
implementation

{$R *.DFM}
uses uProcuraFO;

function Procura(Fonte:TFont;AbreCheio,UsaTeclado:Boolean;AOwner:TComponent;CpBusca,CpSel,NomeBusca,NomeSel,TamSel:TStrings;ADataBasename,Tabelas,
                Condicao:String;var ValSaida:TStrings):Boolean;
var i: Byte;
    sSql:String;
begin
  frmProcura := TfrmProcura.Create(AOwner);
  with frmProcura do
  begin
    cbCampo.Items := CpBusca;
    cbCampo.Text := CpBusca.Strings[0];
    qry.DatabaseName := ADataBaseName;
    NomeTabelas := Tabelas;
    bbtnTeclado.Visible := UsaTeclado;
    CamposSel := TStringList.Create;
    CamposBusca := TStringList.Create;
    CamposBusca := CpBusca;
    CamposSel := CpSel;
    CondicaoEspecial := Condicao;
    bbtnTeclado.Visible := UsaTeclado;
    with qry do
      begin
        sSql := '';
        for i := 0 to CpSel.Count - 1 do
          if i <> CpSel.Count - 1 then
            sSql := sSql + CpSel.Strings[i]+','
          else sSql := sSql + CpSel.Strings[i]+ ' ';
        SQL.Text := 'SELECT '+ uppercase(sSql)+ ' FROM '+uppercase(Tabelas);
        if trim(Condicao) <> '' then
          begin
                 SQL.Add('WHERE '+Condicao);
                 if not AbreCheio then
                   SQL.Add('AND 1 = 2');
          end
        else
            if not AbreCheio then
                 SQL.Add(' WHERE 1 = 2');

        SQL.Add(' ORDER BY '+CpBusca.Strings[0]);
        try
         Cursor := crSQLWait;
         Open;
         Cursor := crDefault;
        except on EDataBaseError do
            Raise;
        end;
      end;

    with Grid do
      begin
       Font := Fonte;
       Selected.Clear;
       for i := 0 to NomeSel.Count - 1 do
         if trim(TamSel.Strings[i]) = '' then
             Selected.Add(TiraNomeTbl(CpSel.Strings[i]) + #9 + IntToStr(qry.FieldDefs.Items[i].Size)
              + #9 + NomeSel.Strings[i])
        else Selected.Add(TiraNomeTbl(CpSel.Strings[i]) + #9 + trim(TamSel.Strings[i])
              + #9 + NomeSel.Strings[i]);
       ApplySelected;
     end;
   with cbCampo do
     begin
       Items.Clear;
       For i := 0 to NomeBusca.Count -1 do
          Items.Add(NomeBusca.Strings[i]);
       ItemIndex := 0;
     end;
   if ShowModal = mrOk then
   begin
     result := true;
     ValSaida := Saidas;
   end
   else
     begin
       result := false;
       ValSaida.Text := '';
     end;
  end;
end;

function TfrmProcura.TiraNomeTbl(const s : string) : string;
var iIndice : integer;
begin
    iIndice := pos('.',s);
    if iIndice > 0 then
         result := copy(s,iIndice+1,length(s)-iIndice)
    else
         result := s;
end;

procedure TfrmProcura.edValProcChange(Sender: TObject);
begin
   Timer1.Enabled := False;
   Timer1.Enabled := True;
end;
procedure TfrmProcura.Busca;
var sSql: String;
    i: Byte;
    tipo:TFieldType;
begin
 Timer1.Enabled := False;
 Tipo := ftString;
 with qry do
  if trim(edValProc.Text) <> '' then
    begin
       sSql := '';
       for i := 0 to FieldCount - 1 do
         if uppercase(FieldDefs.Items[i].Name) = TiraNomeTbl(CamposSel.Strings[cbCampo.ItemIndex]) then
           begin
               tipo := FieldDefs.Items[i].DataType;
               break;
           end;
       for i := 0 to CamposSel.Count - 1 do
         if i <> CamposSel.Count - 1 then
           sSql := sSql + CamposSel.Strings[i]+','
         else sSql := sSql + CamposSel.Strings[i]+ ' ';
       SQL.Clear;
       SQL.Add('SELECT '+ uppercase(sSql)+ ' FROM '+uppercase(NomeTabelas));
       if tipo = ftString then
        begin
         SQL.Add('WHERE UPPER('+CamposSel.Strings[cbCampo.ItemIndex]+') LIKE '+#39+uppercase(edValProc.Text)+'%'+#39);
         if trim(CondicaoEspecial) <> '' then
            SQL.Add('AND '+CondicaoEspecial);
        end
       else
         if (tipo = ftFloat) or (tipo = ftinteger) then
           begin
            try
              StrToFloat(edValProc.Text);
            Except on EConvertError do
             begin
              SQL.Add('WHERE 1 = 2');
              try
                 Cursor := crSQLWait;
                 Open;
                 Cursor := crDefault;
              except on EDataBaseError do
                     Raise;
              end;
              exit;
             end
            end;
            SQL.Add('WHERE '+CamposSel.Strings[cbCampo.ItemIndex]+'='+PontoFlutuante(StrToFloat(edValProc.Text)));
            if trim(CondicaoEspecial) <> '' then
               SQL.Add('AND '+CondicaoEspecial);
            SQL.Add('ORDER BY '+ CamposSel.Strings[cbCampo.ItemIndex]);
           end
         else if tipo = ftDateTime then
           begin
           try
             StrToDateTime(edValProc.Text);
            Except on EConvertError do
             begin
              SQL.Add('WHERE 1 = 2');
              try
                 Cursor := crSQLWait;
                 Open;
                 Cursor := crDefault;
              except on EDataBaseError do
                     Raise;
              end;
              exit;
             end;
            end;
              SQL.Add('WHERE '+CamposSel.Strings[cbCampo.ItemIndex]+'='+Para_Data(StrToDateTime(edValProc.Text)));
              if trim(CondicaoEspecial) <> '' then
                  SQL.Add('AND '+CondicaoEspecial);
           end;
           try
                 Cursor := crSQLWait;
                 Open;
                 Cursor := crDefault;
              except on EDataBaseError do
                     Raise;
              end;
    end
  else
    begin
       for i := 0 to CamposSel.Count - 1 do
         if i <> CamposSel.Count - 1 then
           sSql := sSql + CamposSel.Strings[i]+','
         else sSql := sSql + CamposSel.Strings[i]+ ' ';
       SQL.Clear;
       SQL.Add('SELECT '+ uppercase(sSql)+ ' FROM '+uppercase(NomeTabelas));
       if trim(CondicaoEspecial) <> '' then
            SQL.Add('WHERE '+CondicaoEspecial);
       SQL.Add('ORDER BY '+ CamposSel.Strings[cbCampo.ItemIndex]);

       try
          Cursor := crSQLWait;
          Open;
          Cursor := crDefault;
       except on EDataBaseError do
              Raise;
       end;
    end;

end;
function TfrmProcura.Para_Data(dt: TDateTime): String;
begin
  result := 'TO_DATE('+#39+DateTimeToStr(dt)+#39+','+#39+shortdateformat+#39+')';
end;

function TfrmProcura.PontoFlutuante(x: Real): String;
var i: Integer;
begin
     i := trunc(x * 100);
     i := i div 100;
     result := IntToStr(i) + '.';
     i := trunc(x * 100) mod 100;
     result := result + IntToStr(i);
end;

procedure TfrmProcura.FormShow(Sender: TObject);
begin
  edValProc.SetFocus;
end;

procedure TfrmProcura.cbCampoChange(Sender: TObject);
begin
   if trim(cbCampo.Text) = '' then
     cbCampo.Text := cbCampo.items.Strings[0];
   edValProcChange(self);
   edValProc.SetFocus;
end;

procedure TfrmProcura.botaoOkClick(Sender: TObject);
var i: Byte;
begin
  if Saidas = nil then
    Saidas := TStringList.Create
  else
  Saidas.Clear;
  if qry.Active then
  for i :=0 to CamposSel.Count - 1 do
         Saidas.Add(qry.Fields[i].AsString)
  else
  for i :=0 to CamposSel.Count - 1 do
         Saidas.Add('');

end;

procedure TfrmProcura.bbtnTecladoClick(Sender: TObject);
begin
  if Teclado1.Execute then
    edValProc.Text := Teclado1.Saida;
end;

procedure TfrmProcura.Timer1Timer(Sender: TObject);
begin
 Busca;
end;
end.
