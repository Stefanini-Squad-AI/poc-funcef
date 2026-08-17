unit FProcCodDesc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, StdCtrls, Db, DBTables, Wwquery, ExtCtrls, MAHlpBtn, Buttons,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmProcuraCodDesc = class(TfrmPai)
    Panel1: TPanel;
    pnBotoes: TPanel;
    bbtnOk: TBitBtn;
    bbtnCancela: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    Bevel1: TBevel;
    qryCons: TwwQuery;
    edCodigo: TEdit;
    edNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cmbDesc: TComboBox;
    procedure bbtnCancelaClick(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     sCodigo,sDescricao,sTabela : String;
     nCodigo : integer;
     ResultProc: Integer;
     sTipo, sLabel1, sLabel2, sTiPes : string;
     sRegistro : string;
     nRegistro : integer;
  end;

var
  frmProcuraCodDesc: TfrmProcuraCodDesc;
  liNumRec   : LongInt;

procedure ProcurarCodDesc(dsTabela :TTable; sTitulo:String;sCod:String;
          sDesc:String; sTab:String; sTipoCodigo:string;
          edLabel1:string; edLabel2:string; sTipoPes:string );

implementation

uses FSelecRH, UMensErro, FTelaAut, FCadastroGrid;

{$R *.DFM}

procedure ProcurarCodDesc(dsTabela :TTable; sTitulo:String;sCod:String;
          sDesc:String; sTab:String; sTipoCodigo:string;
          edLabel1:string; edLabel2:string; sTipoPes:string );
begin
  frmProcuraCodDesc.ResultProc := 0;
  if (dsTabela.EOF) and (dsTabela.BOF)
   then begin
      { Temporário }
      MsgDlg('Não existe registro a ser procurado!','Atenção',mtError,[mbOk, mbHelp], 0);
      Exit;
   end;
   With frmProcuraCodDesc do
    begin
        ResultProc := 0;
        Caption := sTitulo;
        sCodigo := sCod;
        sDescricao := sDesc ;
        sTabela := sTab;
        sTipo := sTipoCodigo;
        sLabel1 := edLabel1;
        sLabel2 := edLabel2;
        sTiPes  := sTipoPes;
        //AbrirFormModal(frmProcuraCodDesc, TfrmProcuraCodDesc);
        ShowModal;

   	  if (sRegistro <> '') or (nRegistro <> -1)
   	  then begin
          if sTipo = 'S' then dsTabela.FindKey([frmProcuraCodDesc.sRegistro])
          else if sTipo = 'N' then dsTabela.FindKey([frmProcuraCodDesc.nRegistro]);
        end;
   end;

end;


procedure TfrmProcuraCodDesc.bbtnCancelaClick(Sender: TObject);
begin
  inherited;
   ResultProc  := -1;
   ModalResult := mrCancel;
end;

procedure TfrmProcuraCodDesc.bbtnOkClick(Sender: TObject);
var
   porCod, porNome : Boolean;
begin
  inherited;
   if (Trim(edCodigo.Text) <> '') and  (Trim(edNome.Text) <> '')
   then begin
      Exit;
   end;

   edCodigo.Text   := Trim(edCodigo.Text);
   edNome.Text := Trim(edNome.Text);
   porCod  := edCodigo.Text <> '';
   porNome := edNome.Text <> '';

   { Executa a query }
   qryCons.SQL.Clear;
   //qryCons.SQL.Add('SELECT DISTINCT * FROM '+ sTabela );
   qryCons.SQL.Add('SELECT ' + sCodigo + ', ' + sDescricao +
                   ' FROM '+ sTabela );
   if porCod or porNome then
     begin
       qryCons.SQL.Add(' WHERE ');
       if porCod
         then qryCons.SQL.Add(sCodigo + ' = ''' + edCodigo.Text + ''' ');
       if (porCod and porNome)
         then qryCons.SQL.Add(' AND ');
       if porNome
         then begin
           if cmbDesc.Text = 'Que Contenha' then
              qryCons.SQL.Add( 'UPPER(' + sDescricao + ') LIKE ''%' + edNome.Text + '%'' ')
           else qryCons.SQL.Add( 'UPPER(' + sDescricao + ') LIKE ''' + edNome.Text + '%'' ');
         end;
     end;
     if sTiPes <> ''  then begin
        if porCod or porNome then  qryCons.SQL.Add(' AND ')
                             else  qryCons.SQL.Add(' WHERE ');
        if sTiPes = 'Fis'
           then qryCons.SQL.Add('(FLGFUNCIONARIO = 1 OR FLGCANDIDATO = 1)');
        if sTiPes = 'Jur'
           then qryCons.SQL.Add('TIPO = ' + char(39) + 'J' + char(39));
        if sTiPes = 'Fun'
           then qryCons.SQL.Add('FLGFUNCIONARIO = 1');
        if sTiPes = 'Can'
           then qryCons.SQL.Add('FLGCANDIDATO = 1');
        if sTiPes = 'Fil'
           then qryCons.SQL.Add('FLGFILIALPESSOA = 1');
     end;
   qryCons.SQL.Add(' ORDER BY UPPER(' + sDescricao + ')');
   qryCons.Open;
   qryCons.FieldByName(sCodigo).DisplayLabel := sLabel1{'Código'};
   qryCons.FieldByName(sDescricao).DisplayLabel := sLabel2{'Descrição'};

   ResultProc := qryCons.RecordCount;

   sRegistro := '';
   nRegistro := -1;

   //Verificar se o tipo do código é numérico ou string
   if sTipo = 'S' then  sRegistro :=  qryCons.FieldByName(sCodigo).AsString
   else if sTipo = 'N' then nRegistro :=  qryCons.FieldByName(sCodigo).AsInteger;

   ModalResult := mrOk;
   { Tratar os registros encontrados}
   liNumRec := qryCons.RecordCount;

   if liNumRec = 1     {Encontrado um registro.}
   then begin
      if sTipo = 'S' then  sRegistro :=  qryCons.FieldByName(sCodigo).AsString
      else if sTipo = 'N' then nRegistro :=  qryCons.FieldByName(sCodigo).AsInteger;
   end
   else if liNumRec <> 0
        then begin  {se existe mais de um registro}
           if SelecRH(qryCons, 'Selecionar') {Mostra um formulário contendo o resultado da query}
           then begin
             if sTipo = 'S' then  sRegistro :=  qryCons.FieldByName(sCodigo).AsString
             else if sTipo = 'N' then nRegistro :=  qryCons.FieldByName(sCodigo).AsInteger;
           end
           else begin
                   ModalResult := mrCancel;
                   sRegistro := ''; {pra nao dar o FindKey}
                   nRegistro := -1; {         "           }
                   frmProcuraCodDesc.ResultProc := -1;
           end
        end
        else begin
           MsgDlg({LerMensagem(??)}'Registro Não Encontrado',
                  {LerMensagem(??)}'Aviso', mtInformation, [mbOk,mbHelp], 0);
           sRegistro := ''; {pra nao dar o FindKey}
           nRegistro := -1; {         "           }
           frmProcuraCodDesc.ResultProc := 0;
           ModalResult := mrCancel;
        end;

end;

procedure TfrmProcuraCodDesc.FormShow(Sender: TObject);
begin
  inherited;
   {Muda os títulos}
   if  sLabel1 = ''  then  sLabel1 :=  'Código';
   if  sLabel2 = ''  then  sLabel2 :=  'Descrição';
   Label1.Caption := sLabel1;
   Label2.Caption := sLabel2;
   { Limpa os campos }
   edCodigo.Clear;
   edNome.Clear;
   sRegistro := '';
   nRegistro := -1;
   { Posiciona no primeiro campo }
   edCodigo.SetFocus;
end;

end.
