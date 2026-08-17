unit uIntegraEP;

interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBTables, BDE, DB, Stdctrls, Math, finputvar, VcF1;

   procedure InicializaEP;
   procedure FinalizaEP;



implementation
uses
   DLookEmptmo, dEmptmo, dDividaEP, DMS, DCalcEmptmo, DIntegraEmptmo,
   fProgresso, fProgressoDuplo, fEsperaEP, dAtualizacaoDiaria, dRelatoriosUsu;



// Inicializa Objetos e DataModules utilizados no Sistema de Emprestimo
procedure InicializaEP;
begin
   Application.CreateForm(TdtmEmptmo,              dtmEmptmo);
   Application.CreateForm(TdtmLookEmptmo,          dtmLookEmptmo);
   Application.CreateForm(TdtmMS,                  dtmMS);
   Application.CreateForm(TdtmDividaEP,            dtmDividaEP);
   Application.CreateForm(TdtmCalcEmptmo,          dtmCalcEmptmo);
   Application.CreateForm(TdtmAtualizacaoDiaria,   dtmAtualizacaoDiaria);
   Application.CreateForm(TdtmIntegraEmptmo,       dtmIntegraEmptmo);
   Application.CreateForm(TfrmProgresso,           frmProgresso);
   Application.CreateForm(TfrmProgressoDuplo,      frmProgressoDuplo);
   Application.CreateForm(TfrmEsperaEP,            frmEsperaEP);

   Application.CreateForm(TdtmRelatoriosUsu,       dtmRelatoriosUsu);
end;



// Finaliza Objetos e DataModules utilizados no Sistema de Emprestimo
procedure FinalizaEP;
begin
   dtmEmptmo.Free;
   dtmLookEmptmo.Free;
   dtmMS.Free;
   dtmDividaEP.Free;
   dtmCalcEmptmo.Free;
   dtmIntegraEmptmo.Free;
   frmProgresso.Free;
   frmEsperaEP.Free;

   dtmRelatoriosUsu.Free;
end;



end.
