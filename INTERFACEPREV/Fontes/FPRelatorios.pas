// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 21/08/2007
// Pendência   : 22108
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------

unit FPRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons,  ExtCtrls, Db,
  DBTables, Wwquery, checklst, Spin, wwdblook, TB97, ComCtrls, Wwdatsrc,
  ppDB, ppDBBDE, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm,
  ppProd, ppReport,  Mask, wwdbedit, Wwdbspin, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmPRelatorios = class(TCMParamRel)
    qryPlano: TwwQuery;
    qryPatro: TwwQuery;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    StaticText3: TStaticText;
    chklstPlano: TCheckListBox;
    chklstPatro: TCheckListBox;
    GroupBox1: TGroupBox;
    DateEdit1: TCMDateTimePicker;
    DateEdit2: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    cmbMesRef: TComboBox;
    speAnoRef: TwwDBSpinEdit;
    procedure FormActivate(Sender: TObject);
    procedure bbtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    strPatro,
    strPlano : string;
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
  public
    { Public declarations }

  end;

var
  frmPRelatorios: TfrmPRelatorios;
  DataCot,
  DataRef: string;


implementation

uses {FCMPreview,} UMensErro, dRelatorios;

{$R *.DFM}


procedure TfrmPRelatorios.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);

begin

  chkListX.Items.Clear;

  with qryLista do
  begin

     while not eof do
     begin

        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;

  end;
end;

procedure TfrmPRelatorios.FormActivate(Sender: TObject);

begin
   inherited;

   chklstPlano.Items.Clear;

   with qryPlano do
   begin

      Close;
      SQl.Clear;
      SQL.Add('SELECT   IDPLANOPREV, NOME '+
              'FROM     PLANPREV '+
              'ORDER BY UPPER(NOME)');
      Open;

      while not eof do
      begin

         chklstPlano.Items.Add(FieldByName('Nome').AsString);
         Next;
      end;
   end;

   qryPatro.Close;
   qryPatro.Open;
   chklstPatro.Items.Clear;

   with qryPatro do
   begin

      while not eof do
      begin
         chklstPatro.Items.Add(FieldByName('Nome').AsString);
         Next;
      end;

   end;

end;

procedure TfrmPRelatorios.bbtnFecharClick(Sender: TObject);

begin
  inherited;
  Close;
end;

procedure TfrmPRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);

begin
  inherited;

  qryPatro.Close;
  qryPlano.Close;

end;

procedure TfrmPRelatorios.chklstPatroClickCheck(Sender: TObject);
var
  I : Integer;

begin
  inherited;

  qryPlano.Close;
  qryPlano.SQL.Clear;
  strPatro := ' ';

  for I := 0 to chklstPatro.Items.Count - 1 do

     if chklstPatro.checked[I]then
     begin

        if qryPatro.Locate('Nome',chklstPatro.Items[I],[loCaseInsensitive,loPartialKey])
        then strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
     end;

  if Trim(strPatro) <> ''then
  begin

    strPatro := Copy(strPatro, 1, Length(strPatro) - 2);
    qryPlano.SQL.Add(' SELECT   PP.IDPLANOPREV, PP.NOME '+
                     ' FROM     PLANPREV PP, PLANPREVPATRO PPP '+
                     ' WHERE    PPP.IDPESSJUR  IN ( '+strPatro+') AND '+
                     '          PP.IDPLANOPREV = PPP.IDPLANOPREV  '+
                     ' ORDER BY UPPER(PP.NOME)')

  end
  else

    qryPlano.SQL.Add('SELECT   IDPLANOPREV, NOME '+
                        'FROM     PLANPREV '+
                        'ORDER BY UPPER(NOME)');

  qryPlano.Open;
  CriaLista(chklstPlano,qryPlano);
end;

procedure TfrmPRelatorios.bbtnConfirmarClick(Sender: TObject);
var
   I: Integer;
   MesRef: string;

begin
  inherited;
   with dtmRelatorios do
   begin
        case iQueryRel of

        1:     //RELATÓRIO DE CRÍTICAS
        begin
             strPatro:= '';
             //SELECIONA PATROCINADORAS DE ACORDO COM O CHECKLISTBOX
             for I := 0 to chklstPatro.Items.Count - 1 do
             begin
                 if not chklstPatro.checked[I] then
                    Continue;
                 if qryPatro.Locate('Nome',chklstPatro.Items[I],[loCaseInsensitive,loPartialKey]) then
                    strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
             end;

             if Trim(strPatro) <> '' then
                 strPatro := Copy(strPatro, 1, Length(strPatro) - 2)
             else
             begin//SE NENHUMA PATROCINADORA FOR SELECIONADA EXECUTA A QUERY
                  //PASSANDO MÊS DE REFERÊNCIA COMO PARÂMETRO
                  if cmbMesRef.Text <> '' then
                  begin
                     if cmbMesRef.ItemIndex < 9 then
                        MesRef := speAnoRef.Text+'/'+'0'+IntToStr(cmbMesRef.ItemIndex+1)
                     else
                        MesRef := speAnoRef.Text+'/'+IntToStr(cmbMesRef.ItemIndex+1);

                     qryCRITICAS.Close;
                     qryCRITICAS.SQL.Clear;
                     qryCRITICAS.SQL.Text:=

                     'SELECT '+
                     'ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE, '+
                     'ERRORUBRICAS.MSGERRO, ERRORUBRICAS.VALORCALCULADO, '+
                     'ERRORUBRICAS.VALORIMPORTADO, ERRORUBRICAS.MESREFERENCIA, '+
                     'ERRORUBRICAS.MESCOBRANCA, PLANPREV.NOME AS PLANO, PLANPREV.IDPLANOPREV AS CODIGOPLANO, '+
                     'PESSJUR.NOME AS PATROCINADORA, PESSJUR.IDPESSOA AS CODIGOPATROCINADORA, '+
                     'PROVDESC.DESCRICAO '+
                     'FROM ERRORUBRICAS, PLANPREV, PESSOA PESSJUR, PROVDESC, '+
                     'RUBRICAXPESS '+
                     'WHERE PESSJUR.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
                     'PLANPREV.IDPLANOPREV = ERRORUBRICAS.CODPLANO AND '+
                     'RUBRICAXPESS.CODPROVDESC = ERRORUBRICAS.CODPROVDESC AND '+
                     'RUBRICAXPESS.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
                     'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA AND '+
                     'ERRORUBRICAS.MESREFERENCIA = '''+ MesRef+''' '+
                     'ORDER BY '+
                     'PESSJUR.NOME, PLANPREV.NOME, ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE';

                     qryCRITICAS.Open;
                     exit;
                  end;

                  qryCRITICAS.Close;
                  qryCRITICAS.SQL.Clear;
                  qryCRITICAS.SQL.Text:=
                  //EXECUTA A QUERY SEM NENHUM PARÂMETRO
                  'SELECT '+
                  'ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE, '+
                  'ERRORUBRICAS.MSGERRO, ERRORUBRICAS.VALORCALCULADO, '+
                  'ERRORUBRICAS.VALORIMPORTADO, ERRORUBRICAS.MESREFERENCIA, '+
                  'ERRORUBRICAS.MESCOBRANCA, PLANPREV.NOME AS PLANO, PLANPREV.IDPLANOPREV AS CODIGOPLANO, '+
                  'PESSJUR.NOME AS PATROCINADORA, PESSJUR.IDPESSOA AS CODIGOPATROCINADORA, '+
                  'PROVDESC.DESCRICAO '+
                  'FROM ERRORUBRICAS, PLANPREV, PESSOA PESSJUR, PROVDESC, '+
                  'RUBRICAXPESS '+
                  'WHERE PESSJUR.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
                  'PLANPREV.IDPLANOPREV = ERRORUBRICAS.CODPLANO AND '+
                  'RUBRICAXPESS.CODPROVDESC = ERRORUBRICAS.CODPROVDESC AND '+
                  'RUBRICAXPESS.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
                  'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA '+
                  'ORDER BY '+
                  'PESSJUR.NOME, PLANPREV.NOME, ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE';

                  qryCRITICAS.Open;
                  exit;
             end;

             strPlano := '';
             //SELECIONA PLANOS DE ACORDO COM O CHECKLISTBOX
             for I := 0 to chklstPlano.Items.Count - 1 do
             begin
                 if not chklstPlano.checked[I] then
                    Continue;
                 if qryPlano.Locate('Nome',chklstPlano.Items[I],[loCaseInsensitive,loPartialKey]) then
                    strPlano := strPlano + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
             end;

             if Trim(strPlano) <> '' then
                strPlano := Copy(strPlano, 1, Length(strPlano) - 2)

             else
             begin//SE NENHUM PLANO FOR SELECIONADO EXECUTA A QUERY SOMENTE C/O
                  //FILTRO DE PATROCINADORAS
                  if cmbMesRef.Text <> '' then
                  begin
                     if cmbMesRef.ItemIndex < 9 then
                        MesRef := speAnoRef.Text+'/'+'0'+IntToStr(cmbMesRef.ItemIndex+1)
                     else
                        MesRef := speAnoRef.Text+'/'+IntToStr(cmbMesRef.ItemIndex+1);

                     qryCRITICAS.Close;
                     qryCRITICAS.SQL.Clear;
                     qryCRITICAS.SQL.Text:=
                     //EXECUTA QUERY COM FILTRO DE PATROCINADORAS
                     // E MÊS DE REFERÊNCIA
                     'SELECT '+
                     'ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE, '+
                     'ERRORUBRICAS.MSGERRO, ERRORUBRICAS.VALORCALCULADO, '+
                     'ERRORUBRICAS.VALORIMPORTADO, ERRORUBRICAS.MESREFERENCIA, '+
                     'ERRORUBRICAS.MESCOBRANCA, PLANPREV.NOME AS PLANO, PLANPREV.IDPLANOPREV AS CODIGOPLANO, '+
                     'PESSJUR.NOME AS PATROCINADORA, PESSJUR.IDPESSOA AS CODIGOPATROCINADORA, '+
                     'PROVDESC.DESCRICAO '+
                     'FROM ERRORUBRICAS, PLANPREV, PESSOA PESSJUR, PROVDESC, '+
                     'RUBRICAXPESS '+
                     'WHERE PESSJUR.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
                     'PLANPREV.IDPLANOPREV = ERRORUBRICAS.CODPLANO AND '+
                     'RUBRICAXPESS.CODPROVDESC = ERRORUBRICAS.CODPROVDESC AND '+
                     'RUBRICAXPESS.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
                     'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA AND '+
                     'ERRORUBRICAS.MESREFERENCIA = '''+ MesRef+''' AND '+
                     'PESSJUR.IDPESSOA IN ('+ strPatro+ ') '+
                     'ORDER BY '+
                     'PESSJUR.NOME, PLANPREV.NOME, ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE ';

                     qryCRITICAS.Open;
                     exit;
                  end;

                  qryCRITICAS.Close;
                  qryCRITICAS.SQL.Clear;
                  qryCRITICAS.SQL.Text:=
                  //EXECUTA QUERY COM FILTRO DE PATROCINADORAS
                  'SELECT '+
                  'ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE, '+
                  'ERRORUBRICAS.MSGERRO, ERRORUBRICAS.VALORCALCULADO, '+
                  'ERRORUBRICAS.VALORIMPORTADO, ERRORUBRICAS.MESREFERENCIA, '+
                  'ERRORUBRICAS.MESCOBRANCA, PLANPREV.NOME AS PLANO, PLANPREV.IDPLANOPREV AS CODIGOPLANO, '+
                  'PESSJUR.NOME AS PATROCINADORA, PESSJUR.IDPESSOA AS CODIGOPATROCINADORA, '+
                  'PROVDESC.DESCRICAO '+
                  'FROM ERRORUBRICAS, PLANPREV, PESSOA PESSJUR, PROVDESC, '+
                  'RUBRICAXPESS '+
                  'WHERE PESSJUR.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
                  'PLANPREV.IDPLANOPREV = ERRORUBRICAS.CODPLANO AND '+
                  'RUBRICAXPESS.CODPROVDESC = ERRORUBRICAS.CODPROVDESC AND '+
                  'RUBRICAXPESS.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
                  'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA AND '+
                  'PESSJUR.IDPESSOA IN ('+ strPatro+ ') '+
                  'ORDER BY '+
                  'PESSJUR.NOME, PLANPREV.NOME, ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE ';

                  qryCRITICAS.Open;
                  exit;

             end;

             if cmbMesRef.Text <> '' then
             begin
                if cmbMesRef.ItemIndex < 9 then
                   MesRef := speAnoRef.Text+'/'+'0'+IntToStr(cmbMesRef.ItemIndex+1)
                else
                   MesRef := speAnoRef.Text+'/'+IntToStr(cmbMesRef.ItemIndex+1);

                qryCRITICAS.Close;
                qryCRITICAS.SQL.Clear;
                qryCRITICAS.SQL.Text:=
                //EXECUTA QUERY COM FILTRO DE PATROCINADORAS, PLANOS
                // E MÊS DE REFERÊNCIA
                'SELECT '+
                'ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE, '+
                'ERRORUBRICAS.MSGERRO, ERRORUBRICAS.VALORCALCULADO, '+
                'ERRORUBRICAS.VALORIMPORTADO, ERRORUBRICAS.MESREFERENCIA, '+
                'ERRORUBRICAS.MESCOBRANCA, PLANPREV.NOME AS PLANO, PLANPREV.IDPLANOPREV AS CODIGOPLANO, '+
                'PESSJUR.NOME AS PATROCINADORA, PESSJUR.IDPESSOA AS CODIGOPATROCINADORA, '+
                'PROVDESC.DESCRICAO '+
                'FROM ERRORUBRICAS, PLANPREV, PESSOA PESSJUR, PROVDESC, '+
                'RUBRICAXPESS '+
                'WHERE PESSJUR.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
                'PLANPREV.IDPLANOPREV = ERRORUBRICAS.CODPLANO AND '+
                'RUBRICAXPESS.CODPROVDESC = ERRORUBRICAS.CODPROVDESC AND '+
                'RUBRICAXPESS.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
                'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA AND '+
                'ERRORUBRICAS.MESREFERENCIA = '''+ MesRef+''' AND '+
                'PESSJUR.IDPESSOA IN ('+ strPatro+ ') AND '+
                'PLANPREV.IDPLANOPREV IN ('+ strPlano+ ') '+
                'ORDER BY '+
                'PESSJUR.NOME, PLANPREV.NOME, ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE ';

                qryCRITICAS.Open;
                exit;
             end;

             qryCRITICAS.Close;
             qryCRITICAS.SQL.Clear;
             qryCRITICAS.SQL.Text:=

             //EXECUTA QUERY COM FILTROS POR PATROCINADORA E PLANO
             'SELECT '+
             'ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE, '+
             'ERRORUBRICAS.MSGERRO, ERRORUBRICAS.VALORCALCULADO, '+
             'ERRORUBRICAS.VALORIMPORTADO, ERRORUBRICAS.MESREFERENCIA, '+
             'ERRORUBRICAS.MESCOBRANCA, PLANPREV.NOME AS PLANO, PLANPREV.IDPLANOPREV AS CODIGOPLANO, '+
             'PESSJUR.NOME AS PATROCINADORA, PESSJUR.IDPESSOA AS CODIGOPATROCINADORA, '+
             'PROVDESC.DESCRICAO '+
             'FROM ERRORUBRICAS, PLANPREV, PESSOA PESSJUR, PROVDESC, '+
             'RUBRICAXPESS '+
             'WHERE PESSJUR.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
             'PLANPREV.IDPLANOPREV = ERRORUBRICAS.CODPLANO AND '+
             'RUBRICAXPESS.CODPROVDESC = ERRORUBRICAS.CODPROVDESC AND '+
             'RUBRICAXPESS.IDPESSOA = ERRORUBRICAS.CODPATRO AND '+
             'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA AND '+
             'PESSJUR.IDPESSOA IN ('+ strPatro+ ') AND '+
             'PLANPREV.IDPLANOPREV IN ('+ strPlano+ ') '+
             'ORDER BY '+
             'PESSJUR.NOME, PLANPREV.NOME, ERRORUBRICAS.CHAVE, ERRORUBRICAS.VALORCHAVE ';

             qryCRITICAS.Open;

        end;

        end;
   end;
end;

procedure TfrmPRelatorios.FormShow(Sender: TObject);
begin
  inherited;

  DateEdit1.Text   := FormatDateTime('dd/mm/yyyy', Date);
  DateEdit2.Text   := FormatDateTime('dd/mm/yyyy', Date);
end;

procedure TfrmPRelatorios.FormCreate(Sender: TObject);
begin
  inherited;
  with dtmRelatorios do
  begin
       case iQueryRel of

       1://RELATÓRIO DE CRÍTICAS
       begin
          GroupBox1.SendToBack;
       end;

       end;
  end;

end;

end.
