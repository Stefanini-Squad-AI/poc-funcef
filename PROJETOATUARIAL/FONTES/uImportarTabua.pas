{===============================================================================
Unit    :  uImportarTabua
Form    :  frmImportarTabua

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Importar Tábuas de um Arquivo

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uImportarTabua;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, FileCtrl,
  checklst, Mask, DBCtrls, Wwdatsrc, comctrls;

type
  TfrmImportarTabua = class(TfrmSairAjuda)
    GroupBox1: TGroupBox;
    qryTabua: TwwQuery;
    DBCmbBxTabuaGeral: TwwDBLookupCombo;
    Label1: TLabel;
    RdBttnCalcTab: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    DriveComboBox1: TDriveComboBox;
    DirListBox: TDirectoryListBox;
    FListBox: TFileListBox;
    FilterComboBox1: TFilterComboBox;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    ChckLstBxColunas: TCheckListBox;
    Label5: TLabel;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    edtDiretorio: TEdit;
    Label7: TLabel;
    EdtArqSelec: TEdit;
    BtBtnOk: TBitBtn;
    Panel1: TPanel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    BtBtnCadTabua: TBitBtn;
    DBEdtLx: TDBEdit;
    DBEdtFator: TDBEdit;
    DBEdit1: TDBEdit;
    QryLx: TQuery;
    DtSrcLx: TDataSource;
    DtSrcInsOcorrTabua: TDataSource;
    QryInsOcorrTabua: TQuery;
    QryInsOcorrTabuaSQ_TABUA: TIntegerField;
    QryInsOcorrTabuaNR_IDADE: TIntegerField;
    QryInsOcorrTabuaNR_L_X: TFloatField;
    QryInsOcorrTabuaNR_P_X: TFloatField;
    QryInsOcorrTabuaNR_D_X: TFloatField;
    QryInsOcorrTabuaNR_Q_X: TFloatField;
    QryInsOcorrTabuaNR_I_X: TFloatField;
    MskEdtDelim: TMaskEdit;
    qryTabuaCD_TABUA: TFloatField;
    qryTabuaSG_TABUA: TStringField;
    qryTabuaDT_REF_TABUA: TDateTimeField;
    qryTabuaDS_TABUA: TStringField;
    qryTabuaIR_DOMINIO_SISTEMA: TStringField;
    QryLxNR_IDADE: TFloatField;
    QryLxNR_L_X: TFloatField;
    QryLxNR_I_X: TFloatField;
    qryOcorrencias: TwwQuery;
    dsTabua: TwwDataSource;
    UpdtSQLOcorr: TUpdateSQL;
    function linhastxt(const Arquivo_txt : text) : integer;
    function str_delim (w_str, w_delim : string) : string;
    procedure OrdenarColunas(sel: Integer);
    procedure FListBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DirListBoxChange(Sender: TObject);
    procedure BtBtnCadTabuaClick(Sender: TObject);
    procedure ChckLstBxColunasClickCheck(Sender: TObject);
    procedure RdBttnCalcTabClick(Sender: TObject);
    procedure DBCmbBxTabuaGeralChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtBtnOkClick(Sender: TObject);
    procedure OrdemCampos;
    procedure SelecaoCampos;
    procedure Gera_Tabua;
    procedure gera_tabua_l_x_0;
    procedure gera_tabua_normal;
    procedure GeraTabuaLx;
    procedure LerTabua;
    procedure edt6Exit(Sender: TObject);
    procedure edt6Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportarTabua: TfrmImportarTabua;
  Colunas: Boolean;//Verifica se as Colunas foram Marcadas
  Cancelado: Boolean;//Verifica se a Importação foi Cancelada

{ layout do arquivo txt

        idade   9(03)      //  idade da pessoa
        l_x     9(06)      //  número de pessoas que alcançam com vida a idade exata x
        p_x     9(01).(08) //  probabilidade que tem uma pessoa de idade  x  chegar com vida a idade exata x+n
        d_x     9(06)      //  número de óbitos ocorridos entre as idades exatas x  e x+n
        q_x     9(01).9(08)//  probabilidade morte
        i_x     9(01).9(08)// probabilidade de um ativo entrar em invalidez

  ----------------------------}

  {variáveis do arquivo de entrada}
  w_reg_txt : string;
  {Definição de variaveis gerais}
  Arq_Texto : Text;
  W_Arquivo, W_Diretorio, W_ExtArq : String;
  W_Ok, W_Todos_Ok : boolean;
  w_linhas, w_linha_atual : word;
  w_qtd_lanc : word;
  w_pos, w_i : integer;
  w_valor : array [0..5] of string;
  Ftab_lx : TStringList;
  ind_idade, ind_lx, ind_px, ind_dx, ind_qx, ind_ix : integer;


implementation

uses FTelaAut, uTabua, DBaseDados, FAnimacao;

{$R *.DFM}

{-------------------------------------------------------------------}
{Função para contar linhas de um arquivo .TXT}
function TfrmImportarTabua.linhastxt(const Arquivo_txt : text) : integer;
var
  w_cont : integer;
begin
  linhastxt := 0;
  try
    Reset(Arquivo_Txt);  {Abre arquivo para leitura}
  Except
    on EInOutError do
       begin
          MessageDlg('Erro de abertura do arquivo', mtError,[mbok],0);
          exit;
       end;
  end;

  w_cont := 0;
  while not eof(Arquivo_txt) do begin
     readln(Arquivo_txt);
     w_cont := w_cont + 1;
  end;

  linhastxt := w_cont;
end;

{-------------------------------------------------------------------}
{Função para recuperar um string com delimitador}

function TfrmImportarTabua.str_delim (w_str, w_delim : string) : string;
var
 w_tam : integer;
begin
   w_str := trim(w_str);
   w_tam := pos( w_delim, w_str) - 1;

   if w_tam <= 0 then
      if copy(w_str, 1, 1) = ';' then
         w_str := trim(copy(w_str, 2, w_tam - 1))
      else
   else
      w_str := trim(copy(w_str, 1, w_tam));

   while Pos(' ', w_str) > 0 do
       w_str[Pos(' ', w_str)] := '0';
   while Pos('.', w_str) > 0 do
       w_str[Pos('.', w_str)] := ',';

   str_delim := w_str;
end;

procedure TfrmImportarTabua.OrdenarColunas(sel: Integer);
begin
  case sel of
    1:  edt1.TabOrder := StrToInt(edt1.text) - 1;
    2:  edt2.TabOrder := StrToInt(edt2.text) - 1;
    3:  edt3.TabOrder := StrToInt(edt3.text) - 1;
    4:  edt4.TabOrder := StrToInt(edt4.text) - 1;
    5:  edt5.TabOrder := StrToInt(edt5.text) - 1;
    6:  edt6.TabOrder := StrToInt(edt6.text) - 1;
  end;

  edt1.Text := IntToStr(edt1.TabOrder + 1);
  edt2.Text := IntToStr(edt2.TabOrder + 1);
  edt3.Text := IntToStr(edt3.TabOrder + 1);
  edt4.Text := IntToStr(edt4.TabOrder + 1);
  edt5.Text := IntToStr(edt5.TabOrder + 1);
  edt6.Text := IntToStr(edt6.TabOrder + 1);
end;

procedure TfrmImportarTabua.FListBoxClick(Sender: TObject);
begin
  edtDiretorio.Text := DirListBox.Directory;
  EdtArqSelec.Text := FlistBox.Items.Strings[FListBox.ItemIndex];
end;

procedure TfrmImportarTabua.FormShow(Sender: TObject);
begin
  inherited;
  qryTabua.Open;
  Qrylx.open; 
end;

procedure TfrmImportarTabua.DirListBoxChange(Sender: TObject);
begin
  edtDiretorio.Text := '';
  EdtArqSelec.Text := '';
end;

procedure TfrmImportarTabua.BtBtnCadTabuaClick(Sender: TObject);
begin
  AbrirForm(frmTabua,TfrmTabua,False );

  frmTabua.QryPrincipal.Locate('CD_TABUA',
      qryTabua.FieldByName('CD_TABUA').asInteger, []);
  frmTabua.QryDetalhe.Close;
  frmTabua.QryDetalhe.Open;
  bbtnSair.Click;
end;

procedure TfrmImportarTabua.ChckLstBxColunasClickCheck(Sender: TObject);
begin
  edt1.Visible := ChckLstBxColunas.Checked[0];
  edt2.Visible := ChckLstBxColunas.Checked[1];
  edt3.Visible := ChckLstBxColunas.Checked[2];
  edt4.Visible := ChckLstBxColunas.Checked[3];
  edt5.Visible := ChckLstBxColunas.Checked[4];
  edt6.Visible := ChckLstBxColunas.Checked[5];
  edt6.OnEnter(Sender);
end;

procedure TfrmImportarTabua.RdBttnCalcTabClick(Sender: TObject);
begin
  DBEdtLx.Visible := RdBttnCalcTab.Checked;
  if RdBttnCalcTab.Checked then
    DBEdtLx.SetFocus;
end;

procedure TfrmImportarTabua.DBCmbBxTabuaGeralChange(Sender: TObject);
begin
  btbtnOk.Enabled := not(DBCmbBxTabuaGeral.Text = '');
end;

procedure TfrmImportarTabua.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryTabua.Open;
  Qrylx.open;
  try
   if frmTabua.QryPrincipal.Active then
    begin
     frmTabua.qryDetalhe.Close;
     frmTabua.qryDetalhe.Open;
    end;
  except  end;
  inherited;
end;

procedure TfrmImportarTabua.BtBtnOkClick(Sender: TObject);
var
  i: Byte;
begin
  if (trim(edtDiretorio.Text) = '')
    and (trim(edtArqSelec.Text) = '') then
     begin
      ShowMessage('Selecione um Arquivo !');
      exit;
     end;
  //-- Critica ordem dos campos do arquivo .txt
  OrdemCampos;
  //-- Critica seleção dos campos do arquivo .txt
  SelecaoCampos;

  if (RdBttnCalcTab.Checked) and (DBEdtLx.Text = '') then
   begin
    ShowMessage('Informe o lx inicial !');
    DBEdtLx.SetFocus;
    exit;
   end;
  if (RdBttnCalcTab.Checked) and (StrToInt(DBEdtLx.Text) <= 0) then
   begin
    ShowMessage('lx informado inválido !');
    DBEdtLx.SetFocus;
    exit;
   end;

  qryOcorrencias.Close;
  qryOcorrencias.ParamByName('CD_TABUA').asInteger :=
             qryTabua.FieldByName('CD_TABUA').asInteger;
  qryOcorrencias.Open;

  if qryOcorrencias.RecordCount > 0 then
   begin
     qryOcorrencias.DisableControls;
     // Se Confirmar, Exclui Registro Posicionado
     if MessageBox(0,'A Tábua já possui ocorrências !' + #13#10 +
         'Deseja apagar todas as ocorrências existentes e importar do arquivo?','Cálculo Atuarial',4) = IdYes Then
       Begin
        repeat
         qryOcorrencias.Delete;
         qryOcorrencias.ApplyUpdates;
         qryOcorrencias.CommitUpdates;
        until qryOcorrencias.RecordCount = 0;
       End
      else
       begin
        for i := 0 to 5 do
         ChckLstBxColunas.Checked[i] := false;
        edt1.Visible := false;
        edt2.Visible := false;
        edt3.Visible := false;
        edt4.Visible := false;
        edt5.Visible := false;
        edt6.Visible := false;
        DBCmbBxTabuaGeral.Text := '';
        exit;
       end;
      qryOcorrencias.EnableControls;
      qryOcorrencias.Close;
   end;

  Ftab_lx := TStringList.Create;

  BtBtnOk.enabled := false;
  W_Diretorio := edtDiretorio.Text;
  W_Arquivo := EdtArqSelec.text;
  W_ExtArq := uppercase(ExtractFileExt(W_Arquivo));

  try
   if  W_ExtArq = '.TXT' then
      Gera_Tabua
   else if (W_ExtArq = '.DBF') or (W_ExtArq = '.DB') or (W_ExtArq = '.DBO') then
       {   Copia_dbf {Critica os arquivos .dbf e .db e .dbo}
   else
      Raise Exception.Create('Extensão do Arquivo deve ser .DB, .TXT, DBF ou .DBO !');

   Ftab_lx.free;

  finally
   begin
    for i := 0 to 5 do
      ChckLstBxColunas.Checked[i] := false;
    edt1.Visible := false;
    edt2.Visible := false;
    edt3.Visible := false;
    edt4.Visible := false;
    edt5.Visible := false;
    edt6.Visible := false;
    DBCmbBxTabuaGeral.Text := '';
   end;
  end;
end;

procedure TfrmImportarTabua.OrdemCampos;
var
  w_ordem, w_ordem_seq : array [0..5] of integer;
  w_i : integer;
begin
  w_ordem[0] := strtoint(Edt1.text);
  w_ordem[1] := strtoint(Edt2.text);
  w_ordem[2] := strtoint(Edt3.text);
  w_ordem[3] := strtoint(Edt4.text);
  w_ordem[4] := strtoint(Edt5.text);
  w_ordem[5] := strtoint(Edt6.text);

  w_ordem_seq[0] := 0;
  w_ordem_seq[1] := 0;
  w_ordem_seq[2] := 0;
  w_ordem_seq[3] := 0;
  w_ordem_seq[4] := 0;
  w_ordem_seq[5] := 0;

  for w_i := 0 to 5 do
   begin
     if (w_ordem[w_i] < 1) or (w_ordem[w_i] > 6) then
         Raise Exception.Create
           ('Ordem dos campos inválida !');
     if w_ordem_seq[w_ordem[w_i] - 1] = 0 then
        w_ordem_seq[w_ordem[w_i] - 1] := w_ordem[w_i]
     else
        Raise Exception.Create
           ('Sequência dos campos duplicada !');
   end;
   //-- seta indices a partir das ordens dos campos
   ind_idade   := w_ordem[0]-1;
   ind_lx      := w_ordem[1]-1;
   ind_px      := w_ordem[2]-1;
   ind_dx      := w_ordem[3]-1;
   ind_qx      := w_ordem[4]-1;
   ind_ix      := w_ordem[5]-1;
end;

procedure TfrmImportarTabua.SelecaoCampos;
var
  w_checkd : boolean;
  w_i : integer;
begin
   w_checkd := false;

   for w_i := 0 to 5 do
     if ChckLstBxColunas.checked[w_i] then
        w_checkd := true;

   if not w_checkd then
      Raise Exception.Create
           ('Selecione pelo menos um campo para importação do arquivo .txt');
end;

procedure TfrmImportarTabua.Gera_Tabua;
begin
  //-- Cria Form de Animação
  Application.CreateForm(TfrmAnimacao, frmAnimacao);

  AssignFile (Arq_Texto, W_Diretorio + '\' + W_Arquivo);
  w_linhas := Linhastxt(Arq_Texto); //Número de linhas (registros) do arquivo

  w_linha_Atual := 0;

  frmAnimacao.SetAnimacao ('Importando Tábua ...',w_linhas,True,True,aviCopyFiles);

  try
    Reset(Arq_Texto);  {Abre arquivo para leitura}
  Except
    Raise Exception.Create
      ('Erro de abertura do arquivo: ' + W_Diretorio+'\'+W_Arquivo);
  end;

  cancelado := false;

  try
   if RdBttnCalcTab.checked then
    gera_tabua_l_x_0   // gera tabua a partir do l_x informado
   else
    gera_tabua_normal; // copia tabua do arq txt

   if cancelado then
     exit; 
  finally
   begin
    frmAnimacao.Close;
    frmAnimacao.Free;
   end;
  end;

  ShowMessage('Importação efetuada com sucesso !');
end;

procedure TfrmImportarTabua.gera_tabua_l_x_0;
var
  w_idade, w_i : integer;
  w_l_x ,
  w_fator : real;
  w_var : extended;
begin
  w_l_x := QryLxNR_L_X.asfloat;

  if w_l_x <= 0 then
     Raise Exception.Create
      ('l_x informado inválido !');

  if QryLxNR_IDADE.IsNull then
     w_idade := 0
  else
     w_idade := QryLxNR_IDADE.asinteger;

  if QryLxnr_i_x.IsNull then
     w_fator := 1
  else
     w_fator := QryLxnr_i_x.asfloat;

  {Rotina de Cópia }
  while not eof(Arq_Texto) do
    begin

     Lertabua;

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        Cancelado := true;
        Exit;
      End;


     with dtmBaseDados do
      begin
       dbBaseDados.TransIsolation := tiDirtyRead;
       if not dbBaseDados.InTransaction then
          dbBaseDados.StartTransaction;
      try
       w_reg_txt := trim(w_reg_txt);
       for w_i := 0 to 5 do
         begin
           w_valor[w_i] := str_delim(w_reg_txt, MskEdtDelim.text);
           w_pos := pos(MskEdtDelim.text, w_reg_txt) + 1;
           if w_pos <= 0 then w_pos := 1;
           w_reg_txt := copy (w_reg_txt, w_pos,
                              length(w_reg_txt) - length(w_valor[w_i]));
           if w_valor[w_i] = '' then w_valor[w_i] := '0';
         end;

       if strtofloat(w_valor[ind_qx]) > 0 then  // q_x
          begin
            w_var      := strtofloat(w_valor[ind_qx]) * w_fator;// q_x
            w_valor[ind_qx] := floattostr(w_var);               // q_x
            w_valor[ind_px] := floattostr(1 - w_var);           // p_x
            w_valor[ind_lx] := floattostr(w_l_x);               // l_x
            w_valor[ind_dx] := floattostr(w_var * w_l_x);       // d_x
            w_l_x      := w_l_x - strtofloat(w_valor[ind_dx]);
          end
       else
       if strtofloat(w_valor[ind_px]) > 0 then  // p_x
          begin
            w_var      := strtofloat(w_valor[ind_px]) * w_fator;// p_x
            w_valor[ind_px] := floattostr(w_var)            ;   // p_x
            w_valor[ind_qx] := floattostr(1 - w_var)        ;   // q_x
            w_valor[ind_lx] := floattostr(w_l_x);               // l_x
            w_valor[ind_dx] := floattostr(strtofloat(w_valor[ind_qx])
                                        * w_l_x);          // d_x
            w_l_x      := w_l_x - strtofloat(w_valor[ind_dx]);
          end;

       QryInsOcorrTabua.ParamByName('CD_TABUA').asInteger :=QryTabuaCD_TABUA.asinteger;

       if ChckLstBxColunas.checked[0] then
          QryInsOcorrTabua.ParamByName('NR_IDADE').asinteger := strtoint(w_valor[ind_idade]) // idade
       else
          QryInsOcorrTabua.ParamByName('NR_IDADE').asinteger := w_idade; // idade

       w_idade := w_idade + 1;

       if w_fator > 0 then

       QryInsOcorrTabua.ParamByName('NR_L_X').asFloat := strtofloat(w_valor[ind_lx]);   // l_x
       QryInsOcorrTabua.ParamByName('NR_P_X').asFloat := strtofloat(w_valor[ind_px]);   // p_x
       QryInsOcorrTabua.ParamByName('NR_D_X').asFloat := strtofloat(w_valor[ind_dx]);   // d_x
       QryInsOcorrTabua.ParamByName('NR_Q_X').asFloat := strtofloat(w_valor[ind_qx]);   // q_x
       QryInsOcorrTabua.ParamByName('NR_I_X').asFloat := strtofloat(w_valor[ind_ix]);   // i_x

       QryInsOcorrTabua.Execsql;

       dbBaseDados.Commit;
       dbBaseDados.TransIsolation := tiReadCommitted;
      except
       on EDatabaseError do
        begin
         dbBaseDados.rollback;
         BtBtnOk.enabled := false;
         Raise Exception.Create
          ('Erro na Importação da Tábua !');
        end;
      end; {except}
     end;  {try}
   end;    {begin}
end;

procedure TfrmImportarTabua.gera_tabua_normal;
var
 w_idade, w_i : integer;
 w_fator : real;
begin
  if QryLxNR_IDADE.IsNull then
     w_idade := 0
  else
     w_idade := QryLxNR_IDADE.asinteger;

  if QryLxnr_i_x.IsNull then
     w_fator := 1
  else
     w_fator := QryLxnr_i_x.asfloat;

  {Rotina de Cópia }
  while not eof(Arq_Texto) do
    begin
     Lertabua;

     w_linha_atual := w_linha_atual + 1;
     frmAnimacao.SetProgressBar(w_linha_atual);
     if frmAnimacao.Cancel Then
      Begin
        frmAnimacao.Close;
        frmAnimacao.Free;
        ShowMessage('Processamento cancelado por intervenção do usuário');
        cancelado := true;
        Exit;
      End;

     with dtmBaseDados do
      begin
       dbBaseDados.TransIsolation := tiDirtyRead;
       if not dbBaseDados.InTransaction then
          dbBaseDados.StartTransaction;
      try
        w_reg_txt := trim(w_reg_txt);
        for w_i := 0 to 5 do
        begin
          w_valor[w_i] := str_delim(w_reg_txt, MskEdtDelim.text);
          w_pos := pos(MskEdtDelim.text, w_reg_txt) + 1;
          if w_pos <= 0 then w_pos := 1;
          w_reg_txt := copy (w_reg_txt, w_pos,
                             length(w_reg_txt) - length(w_valor[w_i]));
          if w_valor[w_i] = '' then w_valor[w_i] := '0';
        end; //for
        w_valor[ind_lx] := floattostr(strtofloat(w_valor[ind_lx]) * w_fator);

        if (QryTabuaIR_DOMINIO_SISTEMA.asstring = 'MRT') or
           (QryTabuaIR_DOMINIO_SISTEMA.asstring = 'INV') then

        if (w_valor[ind_idade] = '0') and (w_valor[ind_px] = '0') and
           (w_valor[ind_dx] = '0') and (w_valor[ind_qx] = '0') then
           //-- p_x, d_x e q_x = zeros
           //-- calcula o p_x, d_x e o q_x a partir do l_x
           //      -->  q_x = l_x (x+1) / l_x(x)
          begin
            Ftab_lx.add(w_valor[ind_lx]);
            continue;
          end

         else

        if (w_valor[ind_px] = '0') and (w_valor[ind_qx] = '0')  then
         //-- p_x e q_x = zeros
         //-- calcula o p_x e o q_x a partir do d_x e l_x
         //      -->    q_x = d_x / l_x  e p_x = 1 - q_x
         if strtofloat(w_valor[ind_lx]) > 0.00 then
            begin
             w_valor[ind_qx] := floattostr(
              strtofloat(w_valor[ind_dx])  / strtofloat(w_valor[ind_lx]));   // q_x
             w_valor[ind_px] := floattostr(1 - strtofloat(w_valor[ind_qx]));   // p_x
            end;

        if (w_valor[ind_px] = '0') and (strtofloat(w_valor[ind_qx]) > 0.00)  then
          //-- p_x = 0 e q_x > 0
          //-- calcula o p_x = 1 - q_x
          begin
              w_valor[ind_px] := floattostr(1 - strtofloat(w_valor[ind_qx]));   // p_x
          end;
        if (w_valor[ind_qx] = '0') and (strtofloat(w_valor[ind_px]) > 0.00)  then
          //-- q_x = 0 e p_x > 0
          //-- calcula o q_x = 1 - p_x
          begin
              w_valor[ind_qx] := floattostr(1 - strtofloat(w_valor[ind_px]));   // q_x
          end;

       QryInsOcorrTabua.ParamByName('CD_TABUA').asInteger :=QryTabuaCD_TABUA.asinteger;

       if ChckLstBxColunas.checked[0] then
           QryInsOcorrTabua.ParamByName('NR_IDADE').asinteger := strtoint(w_valor[ind_idade]) // idade
       else
          QryInsOcorrTabua.ParamByName('NR_IDADE').asinteger := w_idade; // idade

       w_idade := w_idade + 1;

       QryInsOcorrTabua.ParamByName('NR_L_X').asFloat := strtofloat(w_valor[ind_lx]);   // l_x
       QryInsOcorrTabua.ParamByName('NR_P_X').asFloat := strtofloat(w_valor[ind_px]);   // p_x
       QryInsOcorrTabua.ParamByName('NR_D_X').asFloat := strtofloat(w_valor[ind_dx]);   // d_x
       QryInsOcorrTabua.ParamByName('NR_Q_X').asFloat := strtofloat(w_valor[ind_qx]);   // q_x
       QryInsOcorrTabua.ParamByName('NR_I_X').asFloat := strtofloat(w_valor[ind_ix]);   // i_x

       QryInsOcorrTabua.Execsql;

       dbBaseDados.Commit;
       dbBaseDados.TransIsolation := tiReadCommitted;
      except
       on EDatabaseError do
        begin
         Ftab_lx.free;
         dbBaseDados.rollback;
         BtBtnOk.enabled := false;
         Raise Exception.Create
          ('Erro na Importação da Tábua !');
        end;
      end; {except}
     end;  {try}
   end;    {begin}
  if Ftab_lx.count > 0 then
     GeraTabuaLx; // gera tabua apenas a partir do lx
end;

procedure TfrmImportarTabua.GeraTabuaLx;
var
  w_idade, w_i : integer;
  w_lx, w_px, w_dx, w_qx : extended;
begin
  if QryLxNR_IDADE.IsNull then
     w_idade := 0
  else
     w_idade := QryLxNR_IDADE.asinteger;

  for w_i := w_idade to Ftab_lx.count - 2 do
   begin
     with dtmBaseDados do
      begin
       dbBaseDados.TransIsolation := tiDirtyRead;
       if not dbBaseDados.InTransaction then
          dbBaseDados.StartTransaction;
      try
       w_lx := strtofloat(Ftab_lx[w_i]);
       if w_lx = 0 then
        begin
         w_px := 0;
         w_qx := 0;
         w_dx := 0;
        end
       else
         begin
          w_px := strtofloat(Ftab_lx[w_i+1]) / strtofloat(Ftab_lx[w_i]);
          w_qx := 1 - w_px;
          w_dx := strtofloat(Ftab_lx[w_i]) - strtofloat(Ftab_lx[w_i+1]);
         end;

       QryInsOcorrTabua.ParamByName('CD_TABUA').asInteger :=QryTabuaCD_TABUA.asinteger;
       QryInsOcorrTabua.ParamByName('NR_IDADE').asinteger := w_i; // idade
       QryInsOcorrTabua.ParamByName('NR_L_X').asFloat := w_lx;   // l_x
       QryInsOcorrTabua.ParamByName('NR_P_X').asFloat := w_px;   // p_x
       QryInsOcorrTabua.ParamByName('NR_D_X').asFloat := w_dx;   // d_x
       QryInsOcorrTabua.ParamByName('NR_Q_X').asFloat := w_qx;   // q_x
       QryInsOcorrTabua.ParamByName('NR_I_X').asFloat := 0;      // i_x

       QryInsOcorrTabua.Execsql;

       dbBaseDados.Commit;
       dbBaseDados.TransIsolation := tiReadCommitted;

      except
       on EDatabaseError do
        begin
         Ftab_lx.free;
         dbBaseDados.rollback;
         BtBtnOk.enabled := false;
         Raise Exception.Create
          ('Erro na Importação da Tábua !');
        end;
      end; {except}
     end;  {try}
   end;    {begin}
end;

procedure TfrmImportarTabua.LerTabua;
begin
  ReadLn (Arq_Texto,   //Lê arquivo txt
          w_reg_txt);
  w_linha_atual := w_linha_atual + 1;
end;

procedure TfrmImportarTabua.edt6Exit(Sender: TObject);
begin
  if (Sender as TEdit).Modified then
   OrdenarColunas((Sender as TEdit).Tag);
end;

procedure TfrmImportarTabua.edt6Enter(Sender: TObject);
begin
  edt1.height := 15;
  edt2.height := 15;
  edt3.height := 15;
  edt4.height := 15;
  edt5.height := 15;
  edt6.height := 15;
end;

end.
