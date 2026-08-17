unit FProcProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FPai, StdCtrls, Db, DBTables, Wwquery, ExtCtrls, MAHlpBtn, Buttons,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmProcuraProc = class(TfrmPai)
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
    Label3: TLabel;
    edNumTRT: TEdit;
    cmbDesc: TComboBox;
    Label4: TLabel;
    edNumTST: TEdit;
    Label5: TLabel;
    edNumJCJ: TEdit;
    Label6: TLabel;
    edJCJ: TEdit;
    Label7: TLabel;
    edTRT: TEdit;
    bbtnLimpar: TBitBtn;
    procedure bbtnCancelaClick(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     sCodigo,sDescricao,sTabela : String;
     nCodigo : integer;
     ResultProc: Integer;
     sTipo, sLabel1, sLabel2, sTiPes : string;
     sRegistro : string;
     nRegistro : Double;
  end;

var
  frmProcuraProc: TfrmProcuraProc;
  liNumRec   : LongInt;

procedure ProcurarProc(dsTabela :TTable; sTitulo:String;sCod:String;
          sDesc:String; sTab:String; sTipoCodigo:string;
          edLabel1:string; edLabel2:string; sTipoPes:string );

implementation

uses FSelecRH, UMensErro, FTelaAut, FCadastroGrid;

{$R *.DFM}

procedure ProcurarProc(dsTabela :TTable; sTitulo:String;sCod:String;
          sDesc:String; sTab:String; sTipoCodigo:string;
          edLabel1:string; edLabel2:string; sTipoPes:string );
begin
  frmProcuraProc.ResultProc := 0;
  if (dsTabela.EOF) and (dsTabela.BOF)
   then begin
      { Temporário }
      MsgDlg('Não existe registro a ser procurado!','Aviso',mtInformation,[mbOk, mbHelp], 0);
      Exit;
   end;
   With frmProcuraProc do
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
          if sTipo = 'S' then dsTabela.FindKey([frmProcuraProc.sRegistro])
          else if sTipo = 'N' then dsTabela.FindKey([frmProcuraProc.nRegistro]);
        end;
   end;

end;


procedure TfrmProcuraProc.bbtnCancelaClick(Sender: TObject);
begin
  inherited;
   ResultProc  := -1;
   ModalResult := mrCancel;
end;

procedure TfrmProcuraProc.bbtnOkClick(Sender: TObject);
begin
  inherited;

   edCodigo.Text   := Trim(edCodigo.Text);
   edJCJ.Text      := Trim(edJCJ.Text);
   edTRT.Text      := Trim(edTRT.Text);
   edNumJCJ.Text   := Trim(edNumJCJ.Text);
   edNumTRT.Text   := Trim(edNumTRT.Text);
   edNumTST.Text   := Trim(edNumTST.Text);
   edNome.Text     := Trim(edNome.Text);

   { Executa a query }
   qryCons.SQL.Clear;

   qryCons.SQL.Add('SELECT PROCESSOTRAB.JCJ, PROCESSOTRAB.PROCJCJNUM, ' +
                   'PROCESSOTRAB.CODIGOTRT, PROCESSOTRAB.PROCTRTNUM, ' +
                   'PROCESSOTRAB.PROCTSTNUM, PROCESSOTRAB.' + sCodigo +
                   ',PESSOA.' + sDescricao + ' FROM '+ sTabela + ', PESSOA');
   qryCons.SQL.Add(' WHERE PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA ');

   if edCodigo.Text <> ''
         then qryCons.SQL.Add(' AND ' + sCodigo + ' = ''' + edCodigo.Text + ''' ');

   if edJCJ.Text <> '' then
      if cmbDesc.Text = 'Que Contenha'  then
         qryCons.SQL.Add(' AND UPPER(JCJ) LIKE ''%' + edJCJ.Text + '%'' ')
      else qryCons.SQL.Add(' AND UPPER(JCJ) LIKE ''' + edJCJ.Text + '%'' ');

   if edNumJCJ.Text <> '' then
      if cmbDesc.Text = 'Que Contenha'  then
         qryCons.SQL.Add(' AND UPPER(PROCJCJNUM) LIKE ''%' + edNumJCJ.Text + '%'' ')
      else qryCons.SQL.Add(' AND UPPER(PROCJCJNUM) LIKE ''' + edNumJCJ.Text + '%'' ');

   if edTRT.Text <> '' then
      if cmbDesc.Text = 'Que Contenha'  then
         qryCons.SQL.Add(' AND UPPER(CODIGOTRT) LIKE ''%' + edTRT.Text + '%'' ')
      else qryCons.SQL.Add(' AND UPPER(CODIGOTRT) LIKE ''' + edTRT.Text + '%'' ');

   if edNumTRT.Text <> '' then
      if cmbDesc.Text = 'Que Contenha'  then
         qryCons.SQL.Add(' AND UPPER(PROCTRTNUM) LIKE ''%' + edNumTRT.Text + '%'' ')
      else qryCons.SQL.Add(' AND UPPER(PROCTRTNUM) LIKE ''' + edNumTRT.Text + '%'' ');

   if edNumTST.Text <> '' then
      if cmbDesc.Text = 'Que Contenha'  then
         qryCons.SQL.Add(' AND UPPER(PROCTSTNUM) LIKE ''%' + edNumTST.Text + '%'' ')
      else qryCons.SQL.Add(' AND UPPER(PROCTSTNUM) LIKE ''' + edNumTST.Text + '%'' ');

   if edNome.Text <> ''   then
      if cmbDesc.Text = 'Que Contenha' then
         qryCons.SQL.Add( ' AND UPPER(' + sDescricao + ') LIKE ''%' + edNome.Text + '%'' ')
      else qryCons.SQL.Add( ' AND UPPER(' + sDescricao + ') LIKE ''' + edNome.Text + '%'' ');

   qryCons.SQL.Add(' ORDER BY UPPER(' + sDescricao + ')'); 

   qryCons.Open;
   qryCons.FieldByName(sCodigo).DisplayLabel := 'Nosso Número';
   qryCons.FieldByName('JCJ').DisplayLabel := 'JCJ';
   qryCons.FieldByName('CODIGOTRT').DisplayLabel  := 'TRT';
   qryCons.FieldByName('PROCJCJNUM').DisplayLabel := 'Número na JCJ';
   qryCons.FieldByName('PROCTRTNUM').DisplayLabel := 'Número no TRT';
   qryCons.FieldByName('PROCTSTNUM').DisplayLabel := 'Número no TST';
   qryCons.FieldByName(sDescricao).DisplayLabel := sLabel2{'Descrição'};

   ResultProc := qryCons.RecordCount;

   sRegistro := '';
   nRegistro := -1;

   //Verificar se o tipo do código é numérico ou string
   if sTipo = 'S' then  sRegistro :=  qryCons.FieldByName(sCodigo).AsString
   else if sTipo = 'N' then
           if qryCons.FieldByName(sCodigo).Value = Null then nRegistro := 0
           else nRegistro := qryCons.FieldByName(sCodigo).Value;

   ModalResult := mrOk;
   { Tratar os registros encontrados}
   liNumRec := qryCons.RecordCount;

   if liNumRec = 1     {Encontrado um registro.}
   then begin
      if sTipo = 'S' then  sRegistro :=  qryCons.FieldByName(sCodigo).AsString
      else if sTipo = 'N' then nRegistro :=  qryCons.FieldByName(sCodigo).Value;
   end
   else if liNumRec <> 0
        then begin  {se existe mais de um registro}

           if SelecRH(qryCons, 'Selecionar') {Mostra um formulário contendo o resultado da query}
           then begin
             if sTipo = 'S' then  sRegistro :=  qryCons.FieldByName(sCodigo).AsString
             else if sTipo = 'N' then nRegistro :=
                                 qryCons.FieldByName(sCodigo).Value;
           end
           else begin
                   ModalResult := mrCancel;
                   sRegistro := ''; {pra nao dar o FindKey}
                   nRegistro := -1; {         "           }
                   frmProcuraProc.ResultProc := -1;
           end
        end
        else begin
           MsgDlg({LerMensagem(??)}'Registro Não Encontrado',
                  {LerMensagem(??)}'Aviso', mtInformation, [mbOk,mbHelp], 0);
           sRegistro := ''; {pra nao dar o FindKey}
           nRegistro := -1; {         "           }
           frmProcuraProc.ResultProc := 0;
           ModalResult := mrCancel;
        end;

end;

procedure TfrmProcuraProc.FormShow(Sender: TObject);
begin
  inherited;
   {Muda os títulos}
   {if  sLabel1 = ''  then  }sLabel1 :=  'Nosso Número';
   {if  sLabel2 = ''  then  }sLabel2 :=  'Reclamante';
   //Label1.Caption := sLabel1;
   Label2.Caption := sLabel2;
   sRegistro := '';
   nRegistro := -1;
   { Posiciona no primeiro campo }
   edCodigo.SetFocus;
end;

procedure TfrmProcuraProc.bbtnLimparClick(Sender: TObject);
begin
  inherited;
   { Limpa os campos }
   edCodigo.Clear;
   edNome.Clear;
   edNumTRT.Clear;
   edNumTST.Clear;
   edNumJCJ.Clear;
   edTRT.Clear;
   edJCJ.Clear;
end;

end.
