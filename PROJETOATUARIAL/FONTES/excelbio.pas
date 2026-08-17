unit excelbio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, {excels,}
  StdCtrls, Mask, DBCtrls, Db, Wwdatsrc, DBTables, Wwquery, Grids, DBGrids,
  ExtCtrls, MAHlpBtn, Buttons, TB97, TB97Tlbr, Spin;

type
  TFrmExcelBio = class(TForm)
    dlg1: TOpenDialog;
    grpboxlinha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnabrir: TButton;
    btnlinhas: TButton;
    grpboxtabela: TGroupBox;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Qrycampos: TQuery;
    QryValor: TQuery;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Btncriar: TButton;
    WQryTabela: TwwQuery;
    DsTabela: TDataSource;
    spin1: TSpinEdit;
    spin2: TSpinEdit;
    spin3: TSpinEdit;
    spin4: TSpinEdit;
    Memo3: TMemo;
    painel3: TPanel;
    procedure btnabrirClick(Sender: TObject);
    procedure btnlinhasClick(Sender: TObject);
    function  formata(texto:string):string;
    procedure BtncriarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure liga(opc:boolean);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExcelBio: TFrmExcelBio;
  area    : trect;
  cont    : integer;
  texto   : String;
  linhas  : tstrings;
  conteudo,conteudo2 : TStringList;

implementation

uses
  DBasedados,umenserro,uDataBase,UGrupoHipotese;

{$R *.DFM}

procedure TFrmExcelBio.btnabrirClick(Sender: TObject);
begin
    if spin2.value < 2 then  begin
     MsgDlg('A Planilha deve pelo menos ter'+#10+#13+'uma linha de valores !','Atenção',mtinformation,[mbOk],0);
     spin2.setfocus;
     exit;
    end;
    if dlg1.execute then
    begin
        area.top    := spin1.value;
        area.Bottom := spin2.value;
        area.left   := spin3.value;
        area.Right  := spin4.value;
        frmexcelbio.update;
        Screen.Cursor := crHourGlass;
        try
           conteudo := TStringList.Create;
        finally
             Screen.Cursor := crDefault;
        end;
        btnlinhas.Visible := true;
    end;
    cont:=0;
    texto:='';
end;

procedure TFrmExcelBio.btnlinhasClick(Sender: TObject);
var
  a:string[1];
  code,totalcolunas,I,x,NUMlinhas,ini:integer;
  Wcampo,WValor,Wtitulo : string;
  valor : double;
begin
  try
    conteudo2:=tstringlist.create;
    NUMlinhas:=conteudo.count;
    for  x:=0 to  numlinhas-1 do
         CONTEUDO2.Add('');
    x:=0;
    cont:=1;
    texto:='';
    while x <= NUMlinhas-1 do
    begin
        a:=copy(conteudo.strings[x],cont,1);

        if a=#9 then
         begin
             conteudo2.Strings[x]:=conteudo2.Strings[x]+formata(texto);
             texto:='';
         end
        else
            if Cont > length(conteudo.strings[x]) then
            begin
              conteudo2.Strings[x]:=conteudo2.Strings[x]+formata(texto);
              texto:='';
              x:=x+1;
              cont:=0
            end else
              texto:=texto+a;
        cont:=cont+1;
    end;
    WQryTabela.post;
    QryValor.Open;
    QryCampos.Open;
    QryCampos.insert;
    QryCampos.fieldbyname('idtabela').asstring:=
       wQryTabela.fieldbyname('idtabela').asstring;

    ini := 1;

    for i := 1 to 60 do begin    // carrega campos e define o total deles
      wtitulo := Trim(Copy(Conteudo2.Strings[0],Ini,60)) ;
      if  wtitulo = '' then break ;
      wCampo := 'C'+IntToStr(I);
      QryCampos.FieldByName(wCampo).AsString := wtitulo;
      ini := ini + 60;
    end;

    totalcolunas := i - 1;

    QryCampos.post;

    X:= 1;
    while X <= NUMlinhas-1 do begin
        Ini:=1;
        QryValor.Insert;

        QryValor.fieldbyname('idtabela').asstring:=
                               WQryTabela.fieldbyname('idtabela').asstring;
        QryValor.FieldByName('Idade').AsInteger := X;

        // Processa Todos os Campos válidos
        For I := 1 To totalcolunas do Begin
          wvalor := FrmGrupoHipotese.TrocaVirgulaPonto(Trim(Copy(Conteudo2.Strings[X],Ini,60)));
          val(Trim(Copy(Conteudo2.Strings[X],Ini,60)),valor,code);
          if code <> 0 then
           val(wvalor,valor,code);

          wValor := 'V'+IntToStr(I);
          QryValor.FieldByName(wValor).AsFloat:= valor;
          // Incrementa Contador de Espaco no String Grid
           ini:=ini+60;
        End ;
       // Baixa no Arquivo
        QryValor.Post;
       // Incrementa Contador de Linhas do Excel
        inc(X);
    end;

    btnabrir.Enabled:=false;
    btnlinhas.Enabled:=false;
    MsgDlg('Importação realizada com sucesso.','Atenção',mtinformation,[mbOk],0);
    Screen.Cursor := crDefault;
    btnlinhas.Visible := false;
  except begin
      MsgDlg('Falha na importação dos dados.','Atenção',mterror,[mbOk,mbHelp],0);
      btnlinhas.Visible := false;
  end;
  end;
   conteudo.free;
end;
function tFrmExcelBio.formata(texto:string):string;
const
  br=' ';
var
   i,letras:integer;
begin
    letras:=60-length(texto);
    result:=texto;
    for i:=1 to letras do
       result:=result+br;
end;
procedure TFrmExcelBio.BtncriarClick(Sender: TObject);
begin
     if not  dtmbasedados.dbbasedados.intransaction  then
        dtmbasedados.dbbasedados.starttransaction;
     wQryTabela.open;
     wQryTabela.Insert;
     liga(true);
     wQryTabela.fieldbyname('idtabela').asInteger :=
       LeUltRegistro(wQryTabela,'TABBIO');
     dbedit2.SetFocus;
end;

procedure TFrmExcelBio.bbtnCancelarClick(Sender: TObject);
begin
     liga(false);
     btnlinhas.Visible := false;
     DtmBasedados.dbbasedados.rollback;
end;

procedure TFrmExcelBio.bbtnConfirmarClick(Sender: TObject);
begin
     liga(false);
     DtmBasedados.dbbasedados.Commit;
end;

procedure tFrmExcelBio.liga(opc:boolean);
begin
     btnabrir.Enabled:=true;
     btnlinhas.Enabled:=true;
     grpboxtabela.enabled:= opc;
     grpboxlinha.enabled:=opc;
     bbtncancelar.enabled:= opc;
     bbtnconfirmar.Enabled:= opc;
     btncriar.Enabled:= not opc;
end;
procedure TFrmExcelBio.bbtnSairClick(Sender: TObject);
begin
  close;
end;


procedure TFrmExcelBio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 WQryTabela.close;
 Qrycampos.close;
 Qryvalor.close;
end;

end.
