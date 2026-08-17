unit umoduloCap;

interface

Uses
  SysUtils, Forms, Controls,MontaSelect,StdCtrls, Wwdbigrd, Wwdbgrid, dBaseDados,
  WwQuery, Classes, Windows, filectrl, uIntegraBack, ppCtrls, Dialogs;

type TmoduloCap = Class
   private
     FIdLocaAtendxCpu, FIdTipoAtend :LongInt;
     bEsperaForm :Boolean;
   public
     Constructor Create;
     Property IdLocaAtendxCpu :LongInt read FIdLocaAtendxCpu write FIdLocaAtendxCpu;
     Property IdTipoAtend     :LongInt read FIdTipoAtend     write FIdTipoAtend;

     Property EsperaForm      :Boolean read bEsperaForm      write bEsperaForm;
     Function VerificaLinhaGrid(Qry:TwwQuery; iTagChave, iTagVazio:Integer;sTabelaMensagem:String;bPermiteChaveVazia:Boolean):Boolean;
     Function GetStatusAtend(bNovoAtendimento:Boolean):String;
   end;

var moduloCap : TmoduloCap;

implementation

Uses fConfSituacaoAtend;

Constructor TmoduloCap.Create;
Begin
  Inherited Create;
  FIdLocaAtendxCpu := 0;
  FIdTipoAtend := 0;
End;

Function TmoduloCap.VerificaLinhaGrid(Qry:TwwQuery; iTagChave, iTagVazio:Integer;sTabelaMensagem:String;bPermiteChaveVazia:Boolean):Boolean;
Var X:Integer;
    sChave: String;
    ListaChave: TStrings;
Begin
   ListaChave := TStringList.Create;

   If Qry.IsEmpty Then
   Begin
      Result := True;
      Exit;
   End;

   Try
      Qry.First;
      While Not Qry.Eof Do
      Begin
          sChave := '';
          For X:=0 To Qry.FieldCount - 1 Do
              If (Qry.Fields[X].Tag = iTagChave) Or (Qry.Fields[X].Tag = iTagVazio) Then
              Begin
                 sChave  := sChave + Trim(Qry.Fields[X].AsString);
                 If (Not bPermiteChaveVazia) And (Qry.Fields[X].Tag <> iTagVazio) Then
                 Begin
                     If Qry.Fields[X].IsNull Then
                     Begin
                       Application.MessageBox(PChar('O Campo ' + Qry.Fields[X].DisPlayLabel + ' do Cadastro de ' + sTabelaMensagem + ' não foi informado'),'Atenção',Mb_IconInformation);
                       Result := False;
                       Exit;
                     End;
                 End;
              End;
          If ListaChave.IndexOf(sChave) <> -1 Then
          Begin
               Application.MessageBox(PChar('O Cadastro de ' + sTabelaMensagem + ' contém um registro repetido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
          End
          Else
            If sChave = '' Then
            Begin
               Application.MessageBox(Pchar('O Cadastro de ' + sTabelaMensagem + ' contém um registro não preenchido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
            End
            Else
               ListaChave.Add(sChave);
          Qry.Next;
      End;
      Qry.First;
      Result := True;
   Finally
      ListaChave.Free;
   End;
End;

Function TmoduloCap.GetStatusAtend(bNovoAtendimento:Boolean):String;
Begin
   Try
      Application.CreateForm(TfrmConfSituacaoAtend,frmConfSituacaoAtend);
      frmConfSituacaoAtend.ShowModal;
      Result := frmConfSituacaoAtend.BtngSitAtend.Selected.Button.Caption;
   finally
      frmConfSituacaoAtend.Free;
   End;
End;

end.

